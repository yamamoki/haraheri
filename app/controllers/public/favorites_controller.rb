class Public::FavoritesController < ApplicationController
  
  def create
    @list = List.find(params[:list_id])
    favorite = current_user.favorites.new(list_id: @list.id)
    favorite.save
  end

  def destroy
    @list = List.find(params[:list_id])
    favorite = current_user.favorites.find_by(list_id: @list.id)
    favorite.destroy
  end

  
end
