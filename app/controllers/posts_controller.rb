class PostsController < ApplicationController
  before_action :require_login, except: [:show]

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
      @shop = Shop.find(params[:shop_id])
      flash.now['danger'] = '投稿に失敗しました'
      render :new
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to shop_path(@post.shop.id), success: '投稿を削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image_cache, :shop_id, { image: [] })
  end
end
