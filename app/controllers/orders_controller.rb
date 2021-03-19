class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[index create] # 未ログインユーザーをログインページへ転送
  before_action :set_item, only: %i[index create]

  def index
    @order_delivery_address = OrderDeliveryAddress.new
    if current_user == @item.user
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_delivery_address = OrderDeliveryAddress.new(order_delivery_address_params)
    if @order_delivery_address.valid?
      pay_item
      @order_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_delivery_address_params
    params.require(:order_delivery_address).permit(:post_code, :place_id, :municipality, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id],
                                                                                                                                       token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_delivery_address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
