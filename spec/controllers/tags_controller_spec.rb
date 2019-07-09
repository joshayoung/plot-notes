require "rails_helper"

RSpec.describe TagsController, type: :controller do
  context "GET #new" do
    it "returns http success" do
      note = create(:note, list: create(:list))

      get :new, params: { list_id: note.list_id, note_id: note.id }

      response.successful?
    end
  end
end
