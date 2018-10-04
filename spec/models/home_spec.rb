require "rails_helper"

RSpec.describe Home, type: :model do
  context "archived_notes method" do
    it "returns all archived notes" do
      list = create(:list)
      list2 = create(:list)
      note1 = create(:note, list_id: list.id, archived: true)
      note2 = create(:note, list_id: list.id, archived: true)
      note3 = create(:note, list_id: list2.id, archived: true)
      create(:note, list_id: list.id, archived: false)
      create(:note, list_id: list2.id, archived: false)
      expect(Home.archived_notes).to eq([note1, note2, note3])
    end
  end

  context "completed_notes method" do
    it "returns all completed notes" do
      list = create(:list)
      list2 = create(:list)
      note1 = create(:note, list_id: list.id, completed: true)
      note2 = create(:note, list_id: list.id, completed: true)
      note3 = create(:note, list_id: list2.id, completed: true)
      create(:note, list_id: list.id, completed: false)
      create(:note, list_id: list2.id, completed: false)
      expect(Home.completed_notes).to eq([note1, note2, note3])
    end
  end
end
