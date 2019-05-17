require "rails_helper"

RSpec.describe List, type: :model do
  context "when validation are executed" do
    it "does not save with a null title" do
      list = build(:list, title: nil).save
      expect(list).to eq(false)
    end
    it "saves with a valid title" do
      list = build(:list).save
      expect(list).to eq(true)
    end
  end
end
