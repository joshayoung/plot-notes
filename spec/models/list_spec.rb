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
end
