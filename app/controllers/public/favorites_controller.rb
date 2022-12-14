class Public::FavoritesController < ApplicationController
  def index
    @user = User.find(params[:list_id])
    @lists = @user.lists
    favorites = Favorite.where(user_id: current_user.id).pluck(:list_id)
    @favorite_list = List.find(favorites)
  end

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
