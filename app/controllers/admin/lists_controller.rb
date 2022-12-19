class Admin::ListsController < ApplicationController
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

  def show
    @list = List.find(params[:id])
    @post_comments = @list.post_comments.includes(:post_comments)
  end
end
