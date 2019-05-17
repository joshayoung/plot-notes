require "rails_helper"

RSpec.describe Note, type: :model do
  context "when validations are executed with a list" do
    it "does not save with a null title" do
      list = build(:list).save
      note = build(:note, title: nil, list_id: list).save
      expect(note).to eq(false)
    end
    it "saves with a valid title" do
      list = build(:list).save
      note = build(:note, list_id: list).save
      expect(note).to eq(true)
    end
  end
  context "when validations are executed without a list" do
    it "does not save" do
      note = build(:note).save
      expect(note).to eq(false)
    end
  end

  context "when the archived method is called" do
    it "returns only archived notes" do
      list = create(:list)
      note1 = create(:note, list_id: list.id, archived: true)
      create(:note, list_id: list.id, archived: false)
      note3 = create(:note, list_id: list.id, archived: true)
      expect(list.notes.archived).to eq([note1, note3])
    end
  end

  context "when the completed method is called" do
    it "returns only completed notes" do
      list = create(:list)
      note1 = create(:note, list_id: list.id, completed: true)
      create(:note, list_id: list.id, completed: false)
      note3 = create(:note, list_id: list.id, completed: true)
      expect(list.notes.completed).to eq([note1, note3])
    end
  end

  context "when the active method is called" do
    it "returns only active notes" do
      list = create(:list)
      create(:note, list_id: list.id, completed: true)
      create(:note, list_id: list.id, archived: true)
      note3 = create(:note, list_id: list.id, completed: false)
      note4 = create(:note, list_id: list.id)
      expect(list.notes.active).to eq([note3, note4])
    end
  end
end
