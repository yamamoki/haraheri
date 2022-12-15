class Admin::PostCommentsController < ApplicationController
  def destroy
    @post_comment = PostComment.find(params[:id]).destroy
    redirect_to admin_list_path(params[:list_id])
  end
end
