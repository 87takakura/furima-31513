# frozen_string_literal: true

class Item < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_one :orders
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :cost
  belongs_to :day
  belongs_to :place


  with_options presence: true do
   validates :name
   validates :information
   validates :image
   validates :price
  end
  
  with_options numericality: { other_than:1, message: "Select" } do
    validates :category_id
    validates :state_id
    validates :cost_id
    validates :place_id
    validates :day_id
  end
  
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }


  def was_attached?
    self.image.attached?
  end

end