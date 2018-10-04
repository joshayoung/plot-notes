class ListsController < ApplicationController
  def show
    @list = List.find_by(id: params[:id])
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List Saved Successfully"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    @list = List.find_by(id: params[:id])
    if @list.update(list_params)
      flash[:notice] = "List Updated Successfully!"
      redirect_to(root_url)
    else
      render :edit
    end
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to(root_url)
  end

  def archived
    @list = List.find_by(id: params[:id])
  end

  def completed
    @list = List.find_by(id: params[:id])
  end

private

  def list_params
    params.require(:list).permit(:title)
  end
end
