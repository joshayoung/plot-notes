require "rails_helper"

RSpec.feature "Notes", type: :feature do
  context "when visiting an individual note page" do
    before(:each) do
      @list = create(:list)
      @note = create(:note, list_id: @list.id)
      visit list_note_path(@list.id, @note.id)
    end
    it "displays note details" do
      expect(page).to have_content @note.title
      expect(page).to have_content @note.details
    end
    it "has a delete link" do
      expect(page).to have_content "Delete"
    end
  end

  context "when visiting the new note page" do
    it "should display notes form" do
      list = create(:list)
      visit new_list_note_path(list)
      expect(page).to have_css("legend", text: "Save New Note")
    end
  end

  context "when editing a note" do
    it "should display a form with data" do
      list = create(:list)
      note = create(:note, list_id: list.id)
      visit edit_list_note_path(list, note)
      expect(page).to have_css("legend", text: "Edit Note")
    end
  end

  context "when creating a new note" do
    before(:each) do
      @list = create(:list)
      visit new_list_note_path(@list)
    end
    it "should fail when the title is null" do
      within("form") do
        fill_in "note_title", with: nil
      end
      click_button "Create"
      expect(page).to have_content("Title is Required!")
    end
    it "should save successfully when the title is filled-in" do
      within("form") do
        fill_in "note_title", with: "Note"
      end
      click_button "Create"
      expect(page).to have_content("Note Saved Successfully")
    end
  end

  context "when a note is updated" do
    before do
      @list = create(:list)
      note = create(:note, list_id: @list.id)
      visit edit_list_note_path(@list, note)
    end
    it "should be save successfully with a valid note title" do
      within("form") do
        fill_in("note_title", with: "First Note")
      end
      click_button "Save"
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

  context "when deleting a note" do
    it "should decrease the notes by one" do
      @list = create(:list)
      note = create(:note, list_id: @list.id)
      visit list_note_path(@list, note)
      expect { click_link("Delete") }.to change(Note, :count).by(-1)
    end
  end

  context "when clicking archive" do
    it "should decrease the active notes by one" do
      list = create(:list)
      create(:note, list_id: list.id)
      visit list_path(list)
      expect { click_link("Archive") }.to change(Note.active, :count).by(-1)
    end
  end

  context "when clicking complete" do
    it "should decrease the active notes by one" do
      list = create(:list)
      create(:note, list_id: list.id)
      visit list_path(list)
      expect { click_link("Complete") }.to change(Note.active, :count).by(-1)
    end
  end
end
