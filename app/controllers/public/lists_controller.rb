class Public::ListsController < ApplicationController
  def index
   if params[:search].blank? && params[:tag_id].blank?
      @lists= List.all
    elsif params[:search].present? && params[:tag_id].blank?
      @lists= List.where("title LIKE ?",'%' + params[:search] + '%')
    elsif params[:search].blank? && params[:tag_id].present?
      @lists = Tag.find(params[:tag_id]).lists
    else
      @lists = Tag.find(params[:tag_id]).lists.where("title LIKE ? ",'%' + params[:search] + '%')
    end
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
    params.require(:list).permit(:title, :material, :body, :image, :draft, tag_ids: [])
  end

end
