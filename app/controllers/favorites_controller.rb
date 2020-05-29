class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    Favorite.create(user_id: current_user.id,post_id: params[:post_id])
    redirect_to posts_url
  end

  def destroy
    current_user.favorites.find_by(post_id: params[:id]).destroy
    redirect_to posts_url
  end
end
