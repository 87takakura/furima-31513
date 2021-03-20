FactoryBot.define do
  factory :order_delivery_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    place_id { 2 }
    municipality { '山田市太郎町' }
    address { '1丁目2−3' }
    building { '東京ハイツ' }
    telephone_number { '12345678912' }
    user_id {FactoryBot.create(:user)}
    item_id {FactoryBot.create(:item)}
  end
end
