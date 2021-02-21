# frozen_string_literal: true

class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :name, :information, :price, presence: true

  validates :category_id, numericality: { other_than: 1 }
end
