require "rails_helper"

RSpec.describe HomesController, type: :controller do
  context "GET #index" do
    render_views
    it "returns http success" do
      get :index
      response.successful?
    end

    it "shows lists" do
      total = List.all.count
      get :index
      expect(response.body).to match total.to_s
    end
  end
end
