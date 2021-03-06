# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できないとき' do
      it 'imageが存在しなければ保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが存在しなければ保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'informationが存在しなければ保存できない' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end

      it 'categoryのidが1では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'stateのidが1では保存できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State Select')
      end

      it 'costのidが1では保存できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost Select')
      end

      it 'placeのidが1では保存できない' do
        @item.place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Place Select')
      end

      it 'dayのidが1では保存できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day Select')
      end

      it 'priceは300以上でなければ保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'priceは9999999以下でなければ保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'priceは空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'priceは全角文字では登録できない' do
        @item.price = 'A'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'priceは半角英数混合では登録できない' do
        @item.price = 'a1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'priceは半角英語だけでは登録できない' do
        @item.price = 'aa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end

    context '出品できるとき' do
      it 'imageが存在すれば保存できる' do
        expect(@item).to be_valid
      end

      it 'nameが存在すれば保存できる' do
        @item.name = 'aあ1'
        expect(@item).to be_valid
      end

      it 'informationが存在すれば保存できる' do
        @item.information = 'aあ1'
        expect(@item).to be_valid
      end

      it 'categoryのidが2~10なら保存できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end

      it 'stateのidが2~6なら保存できる' do
        @item.state_id = 2
        expect(@item).to be_valid
      end

      it 'costのidがidが2~3なら保存できる' do
        @item.cost_id = 2
        expect(@item).to be_valid
      end

      it 'placeのidが2~48なら保存できる' do
        @item.place_id = 2
        expect(@item).to be_valid
      end

      it 'dayのidが2~4なら保存できる' do
        @item.day_id = 2
        expect(@item).to be_valid
      end

      it 'priceは300以上、9999999以下であれば保存できる' do
        @item.price = 1000
        expect(@item).to be_valid
      end

      it 'priceは数字のみであれば保存できる' do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end
  end
end
