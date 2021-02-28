# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.order('created_at DESC')

    #@items = Item.new(item_params)
    #render :new if @item.invalid?
  end

 
  def show
    @item = Item.find(params[:id])
  end





  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)    
     if @item.save
      redirect_to root_path
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
