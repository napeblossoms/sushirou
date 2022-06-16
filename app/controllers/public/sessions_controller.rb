# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before action :end_useer_state, only: [:create]
  
 protected
  #退会してるか確認
  def end_user_status
    @enduser = EndUser.find_by(name: params[:end_user][:email])
    if @end_user
      if @user.valid_password?(params[:end_user][:password]) && (@end_user.is_delete == true)
        redirect_to new_user_session_path
      end
    end
  end
end

  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

