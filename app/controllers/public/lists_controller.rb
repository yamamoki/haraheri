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
    redirect_to '/lists'
    else
    render 'new'
    end
  end

  def show
  end

  def edit
  end

  private

  def list_params
    params.require(:list).permit(:title, :material, :body)
  end

end
