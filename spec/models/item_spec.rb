require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
       @item = FactoryBot.build(:item)
    end
  
  describe '商品出品機能' do

    context '商品出品がうまくいかないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'category_idで---を選択すると登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number", "User must exist")
      end

      it 'prefecture_idで---を選択すると登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "User must exist")
      end

      it 'shipping_fee_status_idで---を選択すると登録できない' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank", "Shipping fee status is not a number", "User must exist")
      end

      it 'sales_status_idで---を選択すると登録できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank", "Sales status is not a number", "User must exist")
      end

      it 'scheduled_delivery_idで---を選択すると登録できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank", "Sales status is not a number", "User must exist")
      end

      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "User must exist")
      end

      it 'priceが300より小さいと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid", "User must exist")
      end

      it 'priceが9999999より大きいと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid", "User must exist")
      end

      it 'priceが全角数字だと登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid", "User must exist")
      end

      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank", "User must exist")
      end



    end


  end


  
end
