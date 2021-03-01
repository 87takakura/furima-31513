# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  def index
    @items = Item.order('created_at DESC')

    #@items = Item.new(item_params)
    #render :new if @item.invalid?
  end

 
  def show
  end


 def edit
 end

 def update
  if @item.update(item_params)
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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def set_item
   @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :information, :user_id, :price, :category_id, :state_id, :cost_id, :place_id,
                                 :day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user == @item.user
      redirect_to root_path
    end
  end   
 
end
