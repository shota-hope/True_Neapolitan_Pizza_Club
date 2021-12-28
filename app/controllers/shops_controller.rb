class ShopsController < ApplicationController
   before_action :set_params_for_google_map, only: [:show]

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  private

  def set_params_for_google_map
    @shop = Shop.find(params[:id])
    gon.center_of_map_lat = @shop.latitude
    gon.center_of_map_lng = @shop.longitude
    gon.zoom_level_of_map = 14
  end
end
