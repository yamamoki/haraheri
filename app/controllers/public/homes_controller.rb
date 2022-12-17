class Public::HomesController < ApplicationController
  def top
    @lists = List.page(params[:page]).order('id DESC').per(3)
  end

  def about
  end
end
