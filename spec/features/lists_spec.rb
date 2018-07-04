require "rails_helper"

RSpec.feature "Lists", type: :feature do
  context "index" do
    it "displays the title" do
      visit lists_path
      expect(page).to have_css("h1", text: "Lists")
    end
  end

  context "show" do
    it "displays details" do
      list = create(:list)
      visit list_path(list)
      expect(page).to have_content list.title
    end
  end

  context "new" do
    it "should display form" do
      visit new_list_path
      expect(page).to have_css("h1", text: "Create New List")
      expect(page).to have_css("form", text: "Title")
    end
  end

  context "edit" do
    it "should display form with data" do
      visit edit_list_path(create(:list))
      expect(page).to have_css("h1", text: "Edit List")
    end
  end

  context "creation" do
    before(:each) do
      visit new_list_path
    end
    it "should fail with message" do
      within("form") do
        fill_in "Title", with: nil
      end
      click_button "Create List"
      expect(page).to have_content("Title is Required!")
    end
    it "should save successfully" do
      within("form") do
        fill_in "Title", with: "List"
      end
      click_button "Create List"
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
        fill_in("Title", with: "First List")
      end
      click_button "Update List"
      expect(current_path).to eql(lists_path)
      expect(page).to have_content "List Updated Successfully!"
    end
    it "should fail" do
      within("form") do
        fill_in "Title", with: nil
      end
      click_button "Update List"
      expect(page).to have_content "Title is Required!"
    end
  end

  context "delete" do
    it "should be successful" do
      visit list_path(create(:list))
      expect { click_link("Delete") }.to change(List, :count).by(-1)
      expect(current_path).to eql(lists_path)
    end
  end
end
