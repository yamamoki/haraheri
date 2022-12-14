class Admin::ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.page(params[:page]).per(10)
  end

  def show
  end
end
