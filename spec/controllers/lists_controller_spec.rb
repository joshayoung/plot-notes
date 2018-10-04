require "rails_helper"

RSpec.describe ListsController, type: :controller do
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
      ## 302
      expect(response).to redirect_to(root_path)
    end
    it "stays on current page on failure" do
      post :create, params: { list: { title: nil } }
      ## 200
      expect(response.status).to eql(200)
    end
  end

  context "PATCH #update" do
    it "returns http success" do
      list = create(:list)
      patch :update, params: { id: list, list: { title: list.title } }
      response.successful?
    end
    it "stays on current page on failure" do
      list = create(:list)
      patch :update, params: { id: list, list: { title: nil } }
      ## 200
      expect(response.status).to eql(200)
    end
  end

  context "DELETE #destroy" do
    it "returns http success" do
      list = create(:list)
      delete :destroy, params: { id: list.to_param }
      response.successful?
      expect(response).to redirect_to(root_path)
    end
  end
end
