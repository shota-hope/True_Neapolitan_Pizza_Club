class OauthsController < ApplicationController
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if auth_params[:denied].present?
      redirect_to root_path, notice: 'ログインをキャンセルしました'
      return
    end
    create_user_from(provider) unless (@user = login_from(provider))
    redirect_to root_path, notice: "#{provider.titleize}でログインしました"
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end

  def create_user_from(provider)
    @user = create_from(provider)
    reset_session
    auto_login(@user)
  end
end
