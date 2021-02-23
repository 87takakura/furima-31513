# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { 'サンプル商品' }
    information { 'あああああ' }
    price { 1000 }
    category_id { 2 }
    state_id { 2 }
    cost_id { 2 }
    place_id { 2 }
    day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
