require 'rails_helper'

RSpec.feature "Notes", type: :feature do
  context "index" do
  end

  context "show" do
    it "displays note details" do
      list = create(:list)
      note = create(:note, list_id: list.id)
      visit list_note_path(list.id, note.id)
      expect(page).to have_content note.title
      expect(page).to have_content note.details
    end
  end

  context "new" do
    it "should display notes form" do
      list = create(:list)
      visit new_list_note_path(list)
      expect(page).to have_css("legend", text: "Save New Note")
    end
  end

  context "edit" do
    it "should display form with data" do
      list = create(:list)
      note = create(:note, list_id: list.id)
      visit edit_list_note_path(list, note)
      expect(page).to have_css("legend", text: "Edit Note")
    end
  end

  context "create" do
    it "should fail with no title" do
    end
    it "should save successfully" do
      list = create(:list)
      visit new_list_note_path(list)
      within("form") do
        fill_in "note_title", with: "Note"
      end
      click_button "Create"
      expect(page).to have_content("Note Saved Successfully")
    end
  end

  context "update" do
    before do
      @list = create(:list)
      note = create(:note, list_id: @list.id)
      visit edit_list_note_path(@list, note)
    end
    it "should be successful" do
      within("form") do
        fill_in("note_title", with: "First Note")
      end
      click_button "Save"
      expect(current_path).to eq(list_notes_path(@list))
      expect(page).to have_content "Note Updated Successfully"
    end
    it "should fail" do
      within("form") do
        fill_in "note_title", with: nil
      end
      click_button "Save"
      expect(page).to have_content "Title is Required"
    end
  end

  context "delete" do
    it "should be successful" do
      @list = create(:list)
      note = create(:note, list_id: @list.id)
      visit list_note_path(@list, note)
      expect { click_link("Delete") }.to change(Note, :count).by(-1)
      expect(current_path).to eq(lists_path)
    end
  end
end
