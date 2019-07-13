require "rails_helper"

RSpec.describe TagsController, type: :controller do
  context "GET #new" do
    it "returns http success" do
      note = create(:note, list: create(:list))

      get :new, params: { list_id: note.list_id, note_id: note.id }

      response.successful?
    end
  end

  context "POST #create" do
    it "redirects to the notes show page for a flash message" do
      list = create(:list)
      note = create(:note, list: list)

      post :create, params: { tag: { title: "programming" }, list_id: note.list_id, note_id: note.id }

      expect(response).to redirect_to(list_note_url(list, note))
      expect(flash[:notice]).to eq("You have successfully added a new tag")
    end
  end
end
