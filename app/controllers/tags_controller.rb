class TagsController < ApplicationController
  def new
    @list = List.find_by(id: params[:list_id])
    @note = Note.find_by(id: params[:note_id])
    @tag = Tag.new
  end
end
