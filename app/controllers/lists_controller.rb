class ListsController < ApplicationController
  before_action :list_id, exclude: [:new, :create]

  def show; end

  def new
    @list = List.new
  end

  def edit; end

  def create
    @list = List.new(list_params)
    return redirect_to root_url, notice: message if @list.save
    render :new
  end

  def update
    return redirect_to root_url, notice: message("Updated") if @list.update(list_params)
    render :edit
  end

  def destroy
    redirect_to(root_url) if @list.destroy
  end

  def archived; end

  def completed; end

private

  def message(msg = nil)
    msg ||= "Saved"
    "List #{msg} Successfully"
  end

  def list_params
    params.require(:list).permit(:title)
  end

  def list_id
    @list = List.find_by(id: params[:id])
  end
end
