class Public::ListsController < ApplicationController
  def index
    @lists = List.where(draft: 'release').page(params[:page])
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    @list.user_id = current_user.id
    if @list.save
    redirect_to list_path(@list.id)
    else
    render 'new'
    end
  end

  def show
    @list = List.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end


  def destroy
    @list = List.find(params[:id]).destroy
    redirect_to list_path(list)
  end

  private

  def list_params
    params.require(:list).permit(:title, :material, :body, :image, :draft)
  end

end
