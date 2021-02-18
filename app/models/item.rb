class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :purchase 
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :cost
  belongs_to :day
  belongs_to :place



  validates :name, :information, :price, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :cost_id, numericality: { other_than: 1 }
  validates :place_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }



end
