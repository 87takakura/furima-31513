# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # 新規登録/ユーザー情報
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    firstname { '山田' }
    lastname { '太郎' }
    katakanafirstname { 'ヤマダ' }
    katakanalastname { 'タロウ' }
    birthday { '1111-11-11' }
    # 新規登録/ユーザー情報
  end
end
