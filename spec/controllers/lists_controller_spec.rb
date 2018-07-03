require "rails_helper"

RSpec.describe ListsController, type: :controller do
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

  context "GET #show" do
    it "returns http success" do
      list = create(:list)
      get :show, params: { id: list.to_param }
      response.successful?
    end
  end

  context "GET #new" do
    it "returns http success" do
      get :new
      response.successful?
    end
  end

  context "GET #edit" do
    it "returns http success" do
      list = create(:list)
      get :edit, params: { id: list.to_param }
      response.successful?
    end
  end

  context "POST #create" do
    it "returns http success" do
      list = create(:list)
      post :create, params: { list: { title: list.title } }
      response.successful?
    end
  end

  context "PATCH #update" do
    it "returns http success" do
      list = create(:list)
      patch :update, params: { id: list, list: { title: list.title } }
      response.successful?
    end
  end

  context "DELETE #destroy" do
    it "returns http success" do
      list = create(:list)
      delete :destroy, params: { id: list.to_param }
      response.successful?
    end
  end

end
