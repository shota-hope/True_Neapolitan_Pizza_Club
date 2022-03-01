class VisitsController < ApplicationController
  before_action :require_login

  def create
    shop = Shop.find(params[:shop_id])
    current_user.visit(shop)
    redirect_to shop_path(shop), success: "#{shop.name}に行った！"
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    current_user.unvisit(shop)
    redirect_to shop_path(shop), success: "行った！を取り消しました"
  end
end
