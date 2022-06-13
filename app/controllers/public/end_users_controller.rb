class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
    @post_sushis = @end_user.post_sushis

  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to public_end_user_path(@end_user.id)
  end

  def favorites
    @end_user = EndUser.find(params[:id])
    favorites = Favorite.where(end_user_id: @end_user.id).pluck(:post_sushi_id)
    @favorite_post_sushis = PostSushi.find(favorites)
  end


    private
  def end_user_params
    params.require(:end_user).permit(:name, :introduction, :profile_image)
  end


end
