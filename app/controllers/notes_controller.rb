class NotesController < ApplicationController

  def show
    list = List.find_by(id: params[:list_id])
    @note = list.notes.find_by(id: params[:id])
  end

  def new
    @list = List.find_by(id: params[:list_id])
    @note = Note.new;
  end

  def edit
    @list = List.find_by(id: params[:list_id])
    @note = @list.notes.find_by(id: params[:id])
  end

  def create
    list = List.find_by(id: params[:list_id])
    @note = list.notes.new(title: params[:note][:title], details: params[:note][:details])
    if @note.save
      flash[:notice] = "Note Saved Successfully"
      redirect_to list_notes_path(list)
    else
      render :new
    end
  end

  def update
    @list = List.find_by(id: params[:list_id])
    @note = @list.notes.find_by(id: params[:id])
    if (@note.update(title: params[:note][:title], details: params[:note][:details]))
      flash[:notice] = "Note Updated Successfully!"
      redirect_to(list_notes_path(@list))
    else
      render :edit
    end
  end

  def destroy; end
end
