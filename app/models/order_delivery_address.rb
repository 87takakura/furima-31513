class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :place_id, :municipality, :address, :building, :telephone_number, :token



 with_options presence: true do
  validates :token, presence: true
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "input correctly" }
  validates :municipality
 end

 with_options numericality: { other_than:1, message: "Select" } do
  validates :place_id
 end

 with_options presence: true do
  validates :address
  validates :telephone_number, format: { with: /\A\d{11}\z/, message: "input only number" }
  validates :item_id
  validates :user_id
 end


def save
  order = Order.create(item_id: item_id, user_id: user_id)
  DeliveryAddress.create(post_code: post_code, place_id: place_id, municipality: municipality, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
end


end
