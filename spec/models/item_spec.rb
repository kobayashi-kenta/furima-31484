require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do 
    before do
      @item = FactoryBot.build(:item)
    end


    context '商品データ正常系テストコード' do
      it 'image,item_name,description,category_id,area_id,money_type_id,send_day_id,status_idが存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end


    context '商品データ異常系テストコード' do
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では保存できないこと' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'descriptionが空では保存できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では保存できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it 'category_idが1では保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'status_idが空では保存できないこと' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end

      it 'status_idが1では保存できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it 'money_type_idが空では保存できないこと' do
        @item.money_type_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Money type can't be blank", "Money type is not a number")
      end

      it 'money_type_idが1では保存できないこと' do
        @item.money_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Money type must be other than 1")
      end

      it 'area_idが空では保存できないこと' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end

      it 'area_idが1では保存できないこと' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it 'send_day_idが空では保存できないこと' do
        @item.send_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank", "Send day is not a number")
      end

      it 'send_day_idが1では保存できないこと' do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day must be other than 1")
      end

      it 'priceが空では保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end

      it '価格が、¥300以下では保存できないこと' do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it '価格が、¥10,000,000以上では保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      it 'priceの値が半角数字以外では保存できないこと' do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end
  end
end


