require "rails_helper"

RSpec.feature "Search", type: :feature do
  context "when visiting the search page" do
    it "displays the search page" do
      visit search_path

      expect(page).to have_content("Search")
    end
  end
end
