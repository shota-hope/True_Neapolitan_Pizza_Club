class ShopsController < ApplicationController
  before_action :set_params_for_google_map, only: [:show]

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).order(id: :asc)
  end

  def show
    @shop = Shop.find(params[:id])
    gon.shop_lat = @shop.latitude
    gon.shop_lng = @shop.longitude
    gon.shop_id = @shop.id
    @posts = @shop.posts.order(created_at: :desc)
  end

  def visits
    @visited_shops = current_user.visited_shops.order(created_at: :desc)
  end

  private

  def set_params_for_google_map
    @shop = Shop.find(params[:id])
    gon.center_of_map_lat = @shop.latitude
    gon.center_of_map_lng = @shop.longitude
    gon.zoom_level_of_map = Settings.shop[:zoom_level_of_map]
    gon.shops_on_map = Shop.all
  end
end
