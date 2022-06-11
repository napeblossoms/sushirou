class Public::FavoritesController < ApplicationController
  def create
    post_sushi = PostSushi.find(params[:post_sushi_id])
    favorite = current_end_user.favorites.new(post_sushi_id: post_sushi.id)
    favorite.save
    redirect_to  public_post_sushi_path(post_sushi)
  end

  def destroy
    post_sushi = PostSushi.find(params[:post_sushi_id])
    favorite = current_end_user.favorites.find_by(post_sushi_id: post_sushi.id)
    favorite.destroy
    redirect_to public_post_sushi_path(post_sushi)
  end


end
