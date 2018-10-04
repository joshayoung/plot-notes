class NotesController < ApplicationController
  def show
    @list = List.find_by(id: params[:list_id])
    @note = @list.notes.find_by(id: params[:id])
  end

  def new
    @list = List.find_by(id: params[:list_id])
    @note = Note.new
  end

  def edit
    @list = List.find_by(id: params[:list_id])
    @note = @list.notes.find_by(id: params[:id])
  end

  def create
    @list = List.find_by(id: params[:list_id])
    @note = @list.notes.new(note_params)
    if @note.save
      flash[:notice] = "Note Saved Successfully"
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def update
    @list = List.find_by(id: params[:list_id])
    @note = @list.notes.find_by(id: params[:id])
    if @note.update(note_params)
      flash[:notice] = "Note Updated Successfully!"
      redirect_to(list_path(@list))
    else
      render :edit
    end
  end

  def destroy
    @list = List.find_by(id: params[:list_id])
    @note = @list.notes.find_by(id: params[:id])
    @note.destroy
    redirect_to(root_url)
  end

  def complete
    @list = List.find_by(id: params[:list_id])
    @note = @list.notes.find_by(id: params[:id])
    @note.update(completed: true)
    flash[:notice] = "Note Updated Successfully!"
    redirect_to(list_path(@list))
  end

  def archive
    @list = List.find_by(id: params[:list_id])
    @note = @list.notes.find_by(id: params[:id])
    @note.update(archived: true)
    flash[:notice] = "Note Updated Successfully!"
    redirect_to(list_path(@list))
  end

private

  def note_params
    params.require(:note).permit(:title, :details)
  end
end
