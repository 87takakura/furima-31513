# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password { "1a" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    firstname { '山田' }
    lastname { '太郎' }
    katakanafirstname { 'ヤマダ' }
    katakanalastname { 'タロウ' }
    birthday { '1111-11-11' }
  end
end
