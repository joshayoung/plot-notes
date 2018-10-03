require "rails_helper"

RSpec.describe List, type: :model do
  context "validation tests" do
    it "list creation requires a title" do
      list = build(:list, title: nil).save
      expect(list).to eq(false)
    end
    it "list saves with a valid title" do
      list = build(:list).save
      expect(list).to eq(true)
    end
  end

  context "archived method" do
    it "only returns archived notes" do
      list = create(:list)
      note1 = create(:note, list_id: list.id, archived: true)
      create(:note, list_id: list.id, archived: false)
      note3 = create(:note, list_id: list.id, archived: true)
      expect(list.archived).to eq([note1, note3])
    end
  end
  context "completed method" do
    it "only returns completed notes" do
      list = create(:list)
      note1 = create(:note, list_id: list.id, completed: true)
      create(:note, list_id: list.id, completed: false)
      note3 = create(:note, list_id: list.id, completed: true)
      expect(list.completed).to eq([note1, note3])
    end

  end
end
