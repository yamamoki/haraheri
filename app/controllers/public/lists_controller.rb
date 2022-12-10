class Public::ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
    redirect_to list_path(@list.id)
    else
    render 'new'
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to '/lists'
  end

  private

  def list_params
    params.require(:list).permit(:title, :material, :body)
  end

end
