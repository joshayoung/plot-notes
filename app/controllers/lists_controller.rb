class ListsController < ApplicationController
  def index; end

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
    @list = List.new(title: params[:list][:title])
    if @list.save
      flash[:notice] = "List Saved Successfully"
      redirect_to lists_url
    else
      render :new
    end
  end

  def update
    @list = List.find_by(id: params[:id])
    if @list.update(title: params[:list][:title])
      flash[:notice] = "List Updated Successfully!"
      redirect_to(lists_url)
    else
      render :edit
    end
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to(lists_url)
  end
end
