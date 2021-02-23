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
        binding.pry
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
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'stateのidが1では保存できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end

      it 'costのidが1では保存できない' do
        @item.cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be other than 1")
      end

      it 'placeのidが1では保存できない' do
        @item.place_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Place must be other than 1")
      end

      it 'dayのidが1では保存できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end

      it 'priceが300より小さければ保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9999999より大きければでは保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
     end
   end
end
