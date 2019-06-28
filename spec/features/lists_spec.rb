require "rails_helper"

RSpec.feature "Lists", type: :feature do
  context "when you visit the show page" do
    before(:each) do
      @list = create(:list)
      create(:note, list_id: @list.id)
      @note1 = create(:note, title: "one", list_id: @list.id, completed: true)
      @note2 = create(:note, title: "two", list_id: @list.id, archived: true)
      @note3 = create(:note, title: "three", list_id: @list.id)
      visit list_path(@list)
    end
    it "displays list title with 'plus' link" do
      expect(page).to have_content @list.title
      expect(page).to have_content "+"
    end
    it "displays links to 'edit', 'delete', and 'tag'" do
      expect(page).to have_content "Edit"
      expect(page).to have_content "Delete"
      expect(page).to have_content "Tag"
    end
    it "only displays active notes for each list" do
      expect(page).not_to have_text(@note1.title)
      expect(page).not_to have_text(@note2.title)
      expect(page).to have_text(@note3.title)
      # TODO: Need to differentiate between this and the one above (edit/delete):
      expect(page).to have_css("li", text: "Edit")
      expect(page).to have_css("li", text: "Delete")
    end
  end

  context "when you click the 'tag' button" do
    before(:each) do
      @list = create(:list)
      create(:note, list_id: @list.id)
      @note1 = create(:note, title: "one", list_id: @list.id, completed: true)
      visit list_path(@list)
    end
    it "opens a form with tagging options" do
      click_link("Tag")

      expect(page).to have_content("Tag Note")
    end
  end

  context "when you navigate to the new page" do
    it "should display form" do
      visit new_list_path
      expect(page).to have_css("legend", text: "Save New List")
    end
  end

  context "when you edit a list" do
    it "should display form with data" do
      visit edit_list_path(create(:list))
      expect(page).to have_css("legend", text: "Edit List")
    end
  end

  context "when you create a list" do
    before(:each) do
      visit new_list_path
    end
    it "should fail with message when title is null" do
      within("form") do
        fill_in "list_title", with: nil
      end
      click_button "Create"
      expect(page).to have_content("Title is Required!")
    end
    it "should save successfully when the title is filled-in" do
      within("form") do
        fill_in "list_title", with: "List"
      end
      click_button "Create"
      expect(page).to have_content("List Saved Successfully")
    end
  end

  context "when you update a list" do
    before(:each) do
      list = create(:list)
      visit edit_list_path(list)
    end
    it "should update and display success message with a valid title" do
      within("form") do
        fill_in("list_title", with: "First List")
      end
      click_button "Save"
      expect(page).to have_content "List Updated Successfully"
    end
    it "should fail when the title is null" do
      within("form") do
        fill_in "list_title", with: nil
      end
      click_button "Save"
      expect(page).to have_content "Title is Required!"
    end
  end

  context "when you delete a list" do
    it "will decrease the list count by one when you click 'Delete'" do
      visit list_path(create(:list))
      expect { click_link("Delete") }.to change(List, :count).by(-1)
    end
  end
end
