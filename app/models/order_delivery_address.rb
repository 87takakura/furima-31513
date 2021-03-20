class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :place_id, :municipality, :address, :building, :telephone_number, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'input correctly' }
    validates :municipality
    validates :address
    validates :telephone_number, format: { with: /\A[0-9]+\z/, message: 'input only number' }
    validates :telephone_number, length: { maximum: 11 }
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :place_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    DeliveryAddress.create(post_code: post_code, place_id: place_id, municipality: municipality, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end
