require "rails_helper"

RSpec.feature "Lists", type: :feature do
  context "index" do
    it "displays the individual lists" do
      list = create(:list)
      list2 = create(:list)
      list3 = create(:list)
      visit lists_path
      expect(page).to have_content list.title
      expect(page).to have_content list2.title
      expect(page).to have_content list3.title
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
      expect(current_path).to eql(lists_path)
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
      expect(current_path).to eql(lists_path)
    end
  end
end
