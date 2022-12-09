class Public::ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
    redirect_to '/users'
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
