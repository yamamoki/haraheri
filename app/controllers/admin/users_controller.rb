class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def show
    @user = User.find(params[:id])
    @lists = @user.lists.page(params[:page]).per(10)
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_users_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end


end