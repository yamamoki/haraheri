class Public::PostCommentsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    post_comment = current_user.post_comments.new(post_comment_params)
    post_comment.list_id = @list.id
    post_comment.save
  end

  def destroy
    @list = List.find(params[:list_id])
    @post_comment = PostComment.find(params[:id]).destroy
    flash[:notice] = "コメントを削除しました。"
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
