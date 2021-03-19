require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  describe '商品購入機能' do
    before do
      @order_delivery_address = FactoryBot.build(:order_delivery_address)
    end

    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@order_delivery_address).to be_valid
    end

    it 'buildingは空でも保存できる' do
      @order_delivery_address.building = ''
      expect(@order_delivery_address).to be_valid
    end

    it 'tokenがあれば保存ができること' do
      expect(@order_delivery_address).to be_valid
      @order_delivery_address.token = 'aaaaaaaa'
    end

    it 'post_codeが空だと保存できない' do
      @order_delivery_address.post_code = ''
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'place_idが空だと保存できない' do
      @order_delivery_address.place_id = ''
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include('Place Select')
    end

    it 'place_idが1だと保存できない' do
      @order_delivery_address.place_id = 1
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include('Place Select')
    end

    it 'addressが空だと保存できない' do
      @order_delivery_address.address = ''
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'telephone_numberが空だと保存できない' do
      @order_delivery_address.telephone_number = ''
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include("Telephone number can't be blank")
    end

    it 'telephone_numberが12桁以上だと保存できない' do
      @order_delivery_address.telephone_number = '123456789012'
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include('Telephone number input only number')
    end

    it 'post_codeにはハイフンが必要であること' do
      @order_delivery_address.post_code = '0000000'
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include('Post code input correctly')
    end
    it 'telephone_numberはハイフン不要でであること' do
      @order_delivery_address.telephone_number = '000-0000-0000'
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include('Telephone number input only number')
    end
    it 'tokenが空では登録できないこと' do
      @order_delivery_address.token = ''
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空では保存できないこと' do
      @order_delivery_address.user_id = ''
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では保存できないこと' do
      @order_delivery_address.item_id = ''
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
