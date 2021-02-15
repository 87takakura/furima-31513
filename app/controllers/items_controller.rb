class ItemsController < ApplicationController
  def index
  end

  def new
   @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :information, :price, :user_id, :category_id, :state_id, :cost_id, :place_id, :day_id, :image).merge(user_id: current_user.id)
  end
end