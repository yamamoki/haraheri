class Users::RegistrationsController < ApplicationController
  before_action :ensure_general_user, only: [:update, :destroy]
  
  def ensure_general_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end
end
