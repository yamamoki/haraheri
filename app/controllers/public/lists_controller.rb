class Public::ListsController < ApplicationController
  def index
    if params[:search].blank? && params[:tag_id].blank?
      @lists= List.where(draft: 'release').page(params[:page]).order('id DESC').per(6)
    elsif params[:search].present? && params[:tag_id].blank?
      @lists= List.where("title LIKE ? or material LIKE ? or body LIKE ? ",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%').page(params[:page]).order('id DESC').per(6)
    elsif params[:search].blank? && params[:tag_id].present?
      @lists = Tag.find(params[:tag_id]).lists.page(params[:page]).order('id DESC').per(6)
    else
      @lists = Tag.find(params[:tag_id]).lists.where("title LIKE ? or material LIKE ? or body LIKE ? ",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%').page(params[:page]).order('id DESC').per(6)
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
    flash[:notice] = "投稿が成功しました"
    else
    render 'new'
    end
  end

  def show
    @list = List.find(params[:id])
    @post_comments = @list.post_comments.includes(:post_comments)
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
    flash[:alert] = "投稿を削除しました"
    redirect_to lists_path(@list)
  end


  private

  def list_params
    params.require(:list).permit(:title, :material, :body, :image, :draft, tag_ids: [])
  end

end
