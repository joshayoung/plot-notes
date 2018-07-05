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
end
