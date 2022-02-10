class PostsController < ApplicationController
  before_action :require_login, only: [:create]

  def new
    @shop = Shop.find(params[:shop_id])
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to shop_path(@post.shop), success: '投稿しました'
    else
      flash.now['danger'] = '投稿に失敗しました'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :image_cache, :shop_id)
  end
end
