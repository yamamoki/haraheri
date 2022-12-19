class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @lists = @user.lists.page(params[:page]).order('id DESC').per(6)
  end

  def edit
    @user = current_user
  end

  def check
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    flash[:notice] = "変更しました"
    redirect_to users_path(current_user)
  end


  def withdrawal
    @user = current_user
    @user.update_columns(is_deleted: true)
    if @user.is_deleted == true
      sign_out current_user
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
