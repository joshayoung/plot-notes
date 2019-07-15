require "rails_helper"

RSpec.feature "Search", type: :feature do
  context "when visiting the search page" do
    it "displays the search page" do
      visit search_path

      expect(page).to have_content("Search")
    end
  end

  context "the search results page" do
    before(:each) do
      list = create(:list)
      note1 = create(:note, title: "test1", list_id: list.id)
      note2 = create(:note, title: "test2", list_id: list.id)
      note3 = create(:note, title: "test3", list_id: list.id)
      create(:tag, title: "todo", note_id: note1.id)
      create(:tag, title: "todo", note_id: note2.id)
      create(:tag, title: "programming", note_id: note3.id)
    end

    it "displays the results after filling out the search form" do
      visit search_path

      within("form") do
        fill_in "search_value", with: "todo"
      end
      click_button "Search"

      expect(page).to have_content "test1"
      expect(page).to have_content "test2"
      expect(page).to_not have_content "test3"
    end

    it "displays the result after visiting the tags route" do
      visit tags_path(tag: "todo")

      expect(page).to have_content "test1"
      expect(page).to have_content "test2"
      expect(page).to_not have_content "test3"
    end
  end
end
