FactoryBot.define do
  factory :order do
    post_code { '123-4567' }
    place_id { 1 }
    municipality { '山田市太郎町' }
    address { '1丁目2−3' }
    building { '東京ハイツ' }
    telephone_number { '123-4567' }
  end
end
