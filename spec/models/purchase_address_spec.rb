require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  
   before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '配送先入力' do
    context '配送先入力がうまくいくとき' do
      it 'postal_codeがあれば登録できること' do
        @purchase_address.postal_code = '024-0333'
        expect(@purchase_address).to be_valid
      end

      it 'prefecture_idで---以外を選択すれば登録できること' do
        @purchase_address.prefecture_id = '3'
        expect(@purchase_address).to be_valid
      end
      
      it 'cityがあれば登録できること' do
        @purchase_address.city = '北上市和賀町長沼'
        expect(@purchase_address).to be_valid
      end

      it 'addressesがあれば登録できること' do
        @purchase_address.addresses = '3地割14番地5'
        expect(@purchase_address).to be_valid
      end

      it 'phone_numberがあれば登録できること' do
        @purchase_address.phone_number = '07020378633'
        expect(@purchase_address).to be_valid 
      end
    end

    context '配送先入力がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
         @purchase_address.postal_code = ''
         @purchase_address.valid?
         expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end

      it 'postal_codeに-が無いと登録できない' do
         @purchase_address.postal_code = '0240333'
         @purchase_address.valid?
         expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idが---を選択すると登録できない' do
         @purchase_address.prefecture_id = '1'
         @purchase_address.valid?
         expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空だと登録できない' do
         @purchase_address.city= ''
         @purchase_address.valid?
         expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressesが空だと登録できない' do
         @purchase_address.addresses= ''
         @purchase_address.valid?
         expect(@purchase_address.errors.full_messages).to include("Addresses can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
         @purchase_address.phone_number= ''
         @purchase_address.valid?
         expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it 'phone_numberが11桁より多いと登録できない' do
         @purchase_address.phone_number= '070203786331'
         @purchase_address.valid?
         expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end


  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'tokenがあれば登録できること' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end


end
