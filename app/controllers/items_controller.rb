# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: [:edit]
  def index
    @items = Item.order('created_at DESC')

    #@items = Item.new(item_params)
    #render :new if @item.invalid?
  end

 
  def show
    @item = Item.find(params[:id])
  end


 def edit
  @item = Item.find(params[:id])
 end

 def update
   item = Item.find(params[:id])
   item.update(item_params)

  if item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end



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

  def move_to_index
   @item = Item.find(params[:id])
    unless current_user == @item.user_id
      redirect_to root_path
    end
  end   
 
end
