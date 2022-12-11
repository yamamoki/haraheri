class Public::UsersController < ApplicationController
  def show
    @lists = List.all.where(draft: 'release')
  end

  def edit
  end

  def check
  end
end
