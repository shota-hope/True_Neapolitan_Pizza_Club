class PostsController < ApplicationController
  before_action :require_login, only: [:create]

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to shop_path(@shop), success: '投稿しました'
    else
      flash.now['danger'] = '投稿に失敗しました'
      render @shop
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :image_cache)
  end
end
