require "rails_helper"

RSpec.describe Note, type: :model do
  context "validation with a list" do
    it "notes require a title" do
      list = build(:list).save
      note = build(:note, title: nil, list_id: list).save
      expect(note).to eq(false)
    end
    it "saves with a title" do
      list = build(:list).save
      note = build(:note, list_id: list).save
      expect(note).to eq(true)
    end
  end
  context "validation without a list" do
    it "does not save" do
      note = build(:note).save
      expect(note).to eq(false)
    end
  end

  context "archived method" do
    it "only returns archived notes" do
      list = create(:list)
      note1 = create(:note, list_id: list.id, archived: true)
      create(:note, list_id: list.id, archived: false)
      note3 = create(:note, list_id: list.id, archived: true)
      expect(list.notes.archived).to eq([note1, note3])
    end
  end

  context "completed method" do
    it "only returns completed notes" do
      list = create(:list)
      note1 = create(:note, list_id: list.id, completed: true)
      create(:note, list_id: list.id, completed: false)
      note3 = create(:note, list_id: list.id, completed: true)
      expect(list.notes.completed).to eq([note1, note3])
    end
  end

  context "active method" do
    it "only returns active notes" do
      list = create(:list)
      create(:note, list_id: list.id, completed: true)
      create(:note, list_id: list.id, archived: true)
      note3 = create(:note, list_id: list.id, completed: false)
      note4 = create(:note, list_id: list.id)
      expect(list.notes.active).to eq([note3, note4])
    end
  end
end
