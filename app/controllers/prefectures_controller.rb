class PrefecturesController < ApplicationController
  before_action :set_center_of_jp, only: [:index]

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)
    gon.shops_on_map = @shops
  end

  def show
    @shop = Shop.find(params[:id])
  end

  private

  def set_center_of_jp
    # googlemapに日本全体を表示するための、中心経度緯度とズームレベル
    gon.center_of_map_lat = Settings.prefecture[:center_of_map_lat]
    gon.center_of_map_lng = Settings.prefecture[:center_of_map_lng]
    gon.zoom_level_of_map = Settings.prefecture[:zoom_level_of_map]
  end
end
