# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
   # Item.create(item_params)
    #@item = @user.items.new(item_params)
     #@item = Item.find(params[:item_id])

    @item = Item.new(item_params)    
     if @item.save
      redirect_to root_path
      #(@user)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :information, :user_id, :price, :category_id, :state_id, :cost_id, :place_id,
                                 :day_id, :image).merge(user_id: current_user.id)
  end
end

# if @item.save
# redirect_to root_path
# else
# render :new
# end
