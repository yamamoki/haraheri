class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @lists = @user.lists
  end

  def edit
  end

  def check
  end
end
