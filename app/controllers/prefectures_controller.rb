class PrefecturesController < ApplicationController
  before_action :set_center_of_jp, only: [:index]

  def index
    @shops = Shop.all
    gon.shops_on_map = @shops
  end

  def show
    @shop = Shop.find(params[:id])
  end

  private

  def set_center_of_jp
      # googlemapに日本全体を表示するための、中心経度緯度とズームレベル
    gon.center_of_map_lat = 38.258595
    gon.center_of_map_lng = 137.6850225
    gon.zoom_level_of_map = 5.7
  end
end
