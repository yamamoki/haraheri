class Users::SessionsController < Devise::SessionsController
  before_action :ensure_general_user, only: :create
  
  def guest_sign_in
    @user = User.guest
    sign_in @user
    redirect_to users_path(@user), notice: 'ゲストでログインしました。'
  end
end