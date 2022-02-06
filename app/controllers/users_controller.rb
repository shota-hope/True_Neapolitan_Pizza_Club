class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_login, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

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

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, success: '更新しました'
    else
      flash.now[:danger] = '編集に失敗しました'
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :profile, :avatar, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
