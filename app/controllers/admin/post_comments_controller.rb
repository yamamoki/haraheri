class Admin::PostCommentsController < ApplicationController
  def destroy
    @list = List.find(params[:list_id])
    @post_comment = PostComment.find(params[:id]).destroy
    flash[:alert] = "削除しました"
  end
end
