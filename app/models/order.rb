class Order < ApplicationRecord
  has_one :delivery_address
end