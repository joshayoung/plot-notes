require "rails_helper"

RSpec.feature "Lists", type: :feature do

  context "show" do
    before(:each) do
      @list = create(:list)
      create(:note, list_id: @list.id)
      @note1 = create(:note, title: "one", list_id: @list.id, completed: true)
      @note2 = create(:note, title: "two", list_id: @list.id, archived: true)
      @note3 = create(:note, title: "three", list_id: @list.id)
      visit list_path(@list)
    end
    it "displays list title with 'New Note' link" do
      expect(page).to have_content @list.title
      expect(page).to have_content "New Note"
    end
    it "displays links to edit and delete the list" do
      expect(page).to have_content "Edit"
      expect(page).to have_content "Delete"
    end
    it "only displays active notes for each list" do
      expect(page).not_to have_text(@note1.title)
      expect(page).not_to have_text(@note2.title)
      expect(page).to have_text(@note3.title)
      #Need to differentiate between this and the one above (edit/delete):
      expect(page).to have_css("li", text: "Edit")
      expect(page).to have_css("li", text: "Delete")
    end
  end

  context "new" do
    it "should display form" do
      visit new_list_path
      expect(page).to have_css("legend", text: "Save New List")
    end
  end

  context "edit" do
    it "should display form with data" do
      visit edit_list_path(create(:list))
      expect(page).to have_css("legend", text: "Edit List")
    end
  end

  context "creation" do
    before(:each) do
      visit new_list_path
    end
    it "should fail with message" do
      within("form") do
        fill_in "list_title", with: nil
      end
      click_button "Create"
      expect(page).to have_content("Title is Required!")
    end
    it "should save successfully" do
      within("form") do
        fill_in "list_title", with: "List"
      end
      click_button "Create"
      expect(page).to have_content("List Saved Successfully")
    end
  end

  context "update" do
    before(:each) do
      list = create(:list)
      visit edit_list_path(list)
    end
    it "should be successful" do
      within("form") do
        fill_in("list_title", with: "First List")
      end
      click_button "Save"
      #expect(current_path).to eql(lists_path)
      expect(page).to have_content "List Updated Successfully!"
    end
    it "should fail" do
      within("form") do
        fill_in "list_title", with: nil
      end
      click_button "Save"
      expect(page).to have_content "Title is Required!"
    end
  end

  context "delete" do
    it "should be successful" do
      visit list_path(create(:list))
      expect { click_link("Delete") }.to change(List, :count).by(-1)
    end
  end
end
