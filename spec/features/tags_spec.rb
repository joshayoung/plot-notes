require "rails_helper"

RSpec.feature "Tags", type: :feature do
  context "when visiting an tag page" do
    before(:each) do
      @list = create(:list)
      @note = create(:note, list_id: @list.id)
    end

    it "displays a new tag form" do
      visit new_list_note_tag_path(@list.id, @note.id)
      expect(page).to have_content "Add New Tag"
      expect(page).to have_css("legend", text: "Save New Tag")
    end

    it "fills out the form and adds a new tag" do
      visit new_list_note_tag_path(@list.id, @note.id)
      within("form") do
        fill_in "tag_title", with: "programming"
      end
      click_button "Save"
      expect(page).to have_content "You have successfully added a new tag"
    end
  end
end
