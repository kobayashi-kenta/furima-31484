require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  before do
    @order_info = FactoryBot.build(:order_info)
  end

  context '商品購入正常系テストコード' do
    it 'user_id,item_id,area_id,adress_number,city,house_number,phone_number,building_name,tokenがあれば保存ができること' do
      expect(@order_info).to be_valid
    end

    it 'user_id,item_id,area_id,adress_number,city,house_number,phone_number,tokenがあれば保存ができること' do
      @order_info.building_name = nil
      expect(@order_info).to be_valid
    end
  end

  context '商品購入異常系テストコード' do
    it 'tokenが空では登録できないこと' do
      @order_info.token = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空では登録できないこと' do
      @order_info.adress_number = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("Adress number can't be blank")
    end

    it '郵便番号にハイフンがなければ登録できないこと' do
      @order_info.adress_number = '1234567'
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include('Adress number is invalid. Include hyphen(-)')
    end

    it '都道府県が空では登録できないこと' do
      @order_info.area_id = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("Area can't be blank")
    end

    it '都道府県が--では登録できないこと' do
      @order_info.area_id = 1
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include('Area must be other than 1')
    end

    it '市区町村が空では登録できないこと' do
      @order_info.city = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では登録できないこと' do
      @order_info.house_number = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号が空では登録できないこと' do
      @order_info.phone_number = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が12桁以上では登録できないこと' do
      @order_info.phone_number = '1234567890123'
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include('Phone number is invalid.')
    end
  end
end
