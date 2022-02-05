class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_path, success: '入部しました'
    else
      flash.now[:danger] = '入部に失敗しました'
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :profile, :avatar, :password, :password_confirmation)
  end
end
