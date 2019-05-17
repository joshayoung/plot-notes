require "rails_helper"

RSpec.describe NotesController, type: :controller do
  context "GET #show" do
    it "returns http success" do
      list = create(:list)
      note = create(:note, list_id: list.id)
      get :show, params: { id: note.to_param, list_id: list.id }
      response.successful?
    end
  end

  context "GET #new" do
    it "returns http success" do
      get :new, params: { list_id: create(:list).id }
      response.successful?
    end
  end

  context "GET #edit" do
    it "returns http success" do
      list = create(:list)
      note = create(:note, list_id: list.id)
      get :edit, params: { id: note.to_param, list_id: list.id }
      response.successful?
    end
  end

  context "POST #create" do
    it "returns http success" do
      list = create(:list)
      note = create(:note, list_id: list.id)
      post :create, params: { note: { title: note.title }, list_id: list.id }
      response.successful?
      ## 302
      expect(response).to redirect_to(list_path(list))
    end
    it "stays on current page on failure" do
      list = create(:list)
      post :create, params: { note: { title: nil }, list_id: list.id }
      ## 200
      expect(response.status).to eql(200)
    end
  end

  context "PATCH #update" do
    it "returns http success" do
      list = create(:list)
      note = create(:note, list_id: list.id)
      patch :update, params: { id: note, note: { title: note.title }, list_id: list.id }
      response.successful?
      expect(response).to redirect_to(list_path(list))
    end
    it "stays on current page on failure" do
      list = create(:list)
      note = create(:note, list_id: list.id)
      patch :update, params: { id: note, note: { title: nil }, list_id: list.id }
      ## 200
      expect(response.status).to eql(200)
    end
  end

  context "DELETE #destroy" do
    it "returns http success" do
      list = create(:list)
      note = create(:note, list_id: list.id)
      delete :destroy, params: { id: note.to_param, list_id: list.id }
      response.successful?
      expect(response).to redirect_to(root_path)
    end
  end
end
