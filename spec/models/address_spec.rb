require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '配送先入力' do
    context '配送先入力がうまくいくとき' do
      it 'postal_codeがあれば登録できること' do
        @address.postal_code = '024-0333'
        expect(@address).to be_valid
      end

      it 'prefecture_idで---以外を選択すれば登録できること' do
        @address.prefecture_id = '3'
        expect(@address).to be_valid
      end
      
      it 'cityがあれば登録できること' do
        @address.city = '北上市和賀町長沼'
        expect(@address).to be_valid
      end

      it 'addressesがあれば登録できること' do
        @address.addresses = '3地割14番地5'
        expect(@address).to be_valid
      end

      it 'phone_numberがあれば登録できること' do
        @address.phone_number = '07020378633'
        expect(@address).to be_valid 
      end
    end

    context '配送先入力がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
         @address.postal_code = ''
         @address.valid?
         expect(@address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end

      it 'postal_codeに-が無いと登録できない' do
         @address.postal_code = '0240333'
         @address.valid?
         expect(@address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idが---を選択すると登録できない' do
         @address.prefecture_id = '1'
         @address.valid?
         expect(@address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空だと登録できない' do
         @address.city= ''
         @address.valid?
         expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressesが空だと登録できない' do
         @address.addresses= ''
         @address.valid?
         expect(@address.errors.full_messages).to include("Addresses can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
         @address.phone_number= ''
         @address.valid?
         expect(@address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it 'phone_numberが11桁より多いと登録できない' do
         @address.phone_number= '070203786331'
         @address.valid?
         expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
