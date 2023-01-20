class Public::PostCommentsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    post_comment = current_user.post_comments.new(post_comment_params)
    post_comment.list_id = @list.id
    if post_comment.save
      render :create
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @post_comment = PostComment.find(params[:id]).destroy
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
