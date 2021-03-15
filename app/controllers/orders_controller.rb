class OrdersController < ApplicationController

def index
  @item = Item.find(params[:item_id])
  @order_delivery_address = OrderDeliveryAddress.new

end

def create
  @item = Item.find(params[:item_id])
  @order_delivery_address = OrderDeliveryAddress.new(order_delivery_address_params)
  if @order_delivery_address.valid?
    pay_item
    @order_delivery_address.save
    return redirect_to root_path 
  else
    render :index
  end
end


private



 def order_delivery_address_params
  params.require(:order_delivery_address).permit(:post_code, :place_id, :municipality, :address, :building, :telephone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end


 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_delivery_address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
 end
end