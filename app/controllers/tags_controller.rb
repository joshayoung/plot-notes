class TagsController < ApplicationController
  def new
    @list = List.find_by(id: params[:list_id])
    @note = Note.find_by(id: params[:note_id])
    @tag = Tag.new
  end

  def create
    @list = List.find(params[:list_id])
    @note = Note.find(params[:note_id])
    @tag = @note.tags.new
    redirect_to list_note_url(@list, @note), notice: "You have successfully added a new tag" if @tag.save
  end
end
