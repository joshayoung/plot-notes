require "rails_helper"

RSpec.feature "Search", type: :feature do
  context "when visiting the search page" do
    it "displays the search page" do
      visit search_path

      expect(page).to have_content("Search")
    end
  end

  context "when filling out the search form" do
    it "searches successfully" do
      visit search_path

      within("form") do
        fill_in "search_value", with: "test"
      end
      click_button "Search"

      expect(page).to have_content "Search Results"
    end
  end
end
