class Public::SessionsController < Devise::SessionsController
  before_action :end_user_state, only: [:create]

  protected
  #退会してるか確認
  def end_user_state
    @end_user = EndUser.find_by(name: params[:end_user][:email])
    if @end_user
      if @end_user.valid_password?(params[:end_user][:password]) && (@end_user.is_delete == true)
        redirect_to new_end_user_session_path
      end
    end
  end
end
