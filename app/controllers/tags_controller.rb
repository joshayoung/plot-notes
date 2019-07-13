class TagsController < ApplicationController
  def new
    @list = List.find_by(id: params[:list_id])
    @note = Note.find_by(id: params[:note_id])
    @tag = Tag.new
  end

  def create
    @note = Note.find(params[:note_id])
    @tag = @note.tags.new(tag_title)
    redirect_to note_page, notice: t(".success") if @tag.save
  end

  def note_page
    @list = List.find(params[:list_id])
    @note = Note.find(params[:note_id])
    list_note_url(@list, @note)
  end

  def tag_title
    params.require(:tag).permit(:title)
  end
end
