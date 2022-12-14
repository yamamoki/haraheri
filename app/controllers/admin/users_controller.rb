class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @user = User.find(params[:id])
    @lists = @user.lists.page(params[:page]).per(10)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "変更しました"
    redirect_to admin_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end


end