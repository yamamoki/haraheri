class Public::PostCommentsController < ApplicationController

  def create
    list = List.find(params[:list_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.list_id = list.id
    comment.save
    redirect_to list_path(list)
  end

  def destroy
    post_comment = PostComment.find(params[:id]).destroy
    flash[:notice] = "コメントを削除しました。"
    redirect_to list_path(params[:list_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
