class FavoritesController < ApplicationController
  before_action :hello_world, only: [:index]
  def index
    @favorites = current_user.favorite_feeds
  end
  def create
    favorite = current_user.favorites.create(feed_id: params[:feed_id])
    redirect_to feeds_url, notice: "#{favorite.feed.user.name}さんの画像をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to feeds_url, notice: "#{favorite.feed.user.name}さんの画像をお気に入り解除しました"
  end
end
