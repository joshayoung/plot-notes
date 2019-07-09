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
  end
end
