class NotesController < ApplicationController
  before_action :list_note_id, exclude: [:new, :create]

  def show; end

  def new
    @list = list_id
    @note = Note.new
  end

  def edit; end

  def create
    @list = list_id
    @note = @list.notes.new(note_params)
    return redirect_to list_path(@list), notice: "Note Saved Successfully" if @note.save
    render :new
  end

  def update
    return redirect_to list_path(@list), notice: "Note Updated Successfully!" if @note.update(note_params)
    render :edit
  end

  def destroy
    @note.destroy
    redirect_to(root_url)
  end

  def complete
    redirect_to list_path(@list), notice: "Note Updated Successfully!" if @note.update(completed: true)
  end

  def archive
    redirect_to list_path(@list), notice: "Note Updated Successfully!" if @note.update(archived: true)
  end

private

  def list_id
    List.find_by(id: params[:list_id])
  end

  def list_note_id
    @list = List.find_by(id: params[:list_id])
    @note = @list.notes.find_by(id: params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :details)
  end
end
