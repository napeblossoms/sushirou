class Public::RelationshipsController < ApplicationController
  before_action :authenticate_end_user!
  #フォローする
  def create
    current_end_user.follow(params[:end_user_id])
    redirect_to request.referer
  end

  #フォローを外す
  def destroy
    current_end_user.unfollow(params[:end_user_id])
    redirect_to request.referer
  end

  #フォロー一覧
  def followings
    end_user = EndUser.find(params[:end_user_id])
    @end_users = end_user.followings
  end

 #フォロワー一覧
  def followers
    end_user = EndUser.find(params[:end_user_id])
    @end_users = end_user.followers
  end


end
