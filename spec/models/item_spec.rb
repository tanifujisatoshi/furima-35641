require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'imageがあれば登録できること' do
        expect(@item).to be_valid
      end

      it 'nameがあれば登録できること' do
        @item.name = '商品'
        expect(@item).to be_valid
      end

      it 'infoがあれば登録できること' do
        @item.info = 'よろしくお願いします'
        expect(@item).to be_valid
      end

      it 'category_idで---以外を選択すると登録できること' do
        @item.category_id = 2
        expect(@item).to be_valid
      end

      it 'sales_status_idで---以外を選択すると登録できること' do
        @item.sales_status_id = 2
        expect(@item).to be_valid
      end

      it 'shipping_fee_status_idで---以外を選択すると登録できること' do
        @item.shipping_fee_status_id = 2
        expect(@item).to be_valid
      end

      it 'prefecture_idで---以外を選択すると登録できること' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end

      it 'scheduled_delivery_idで---以外を選択すると登録できること' do
        @item.scheduled_delivery_id = 2
        expect(@item).to be_valid
      end

      it 'priceがあれば登録できること' do
        @item.price = 1000
        expect(@item).to be_valid
      end

      it 'priceが半角数字であれば登録できること' do
        @item.price = 30_000
        expect(@item).to be_valid
      end
    end

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
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'prefecture_idで---を選択すると登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'shipping_fee_status_idで---を選択すると登録できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status must be other than 1')
      end

      it 'sales_status_idで---を選択すると登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status must be other than 1')
      end

      it 'scheduled_delivery_idで---を選択すると登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
      end

      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300より小さいと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it 'priceが9999999より大きいと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it 'priceが全角数字だと登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it 'priceが英数字混合だと登録できないこと' do
        @item.price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it 'priceが半角英字では登録できないこと' do
        @item.price = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
