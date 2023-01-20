class Public::HomesController < ApplicationController
  def top
    @lists = List.where(draft: 'release').page(params[:page]).order('id DESC').per(3)
  end

  def about
  end
end
