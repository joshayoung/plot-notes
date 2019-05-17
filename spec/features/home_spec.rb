require "rails_helper"

RSpec.feature "Home", type: :feature do
  context "when you visit the index page" do
    it "displays the individual lists" do
      list = create(:list)
      list2 = create(:list)
      list3 = create(:list)
      visit root_path
      expect(page).to have_content list.title
      expect(page).to have_content list2.title
      expect(page).to have_content list3.title
    end
  end
end