class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @lists = @user.lists.page(params[:page])
  end

  def edit
    @user = current_user
  end

  def check
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_path(current_user)
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
