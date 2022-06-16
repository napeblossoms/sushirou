class Public::EndUsersController < ApplicationController
  before_action :ensure_guest_end_user, only: [:edit]
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
  
  def withdrawal
    @end_user = EndUser.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to new_end_user_session_path
  end
  
  def unsubscribe
    @end_user = EndUser.find(params[:id])
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :introduction, :profile_image)
  end

  def ensure_guest_end_user #ゲストログイン時に直打ちで編集画面に遷移できないようにする
    @end_user = EndUser.find(params[:id])
    if @end_user.name == "guestuser"
      redirect_to  public_end_user_path(current_end_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
