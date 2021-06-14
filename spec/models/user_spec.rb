require 'rails_helper'

RSpec.describe User, type: :model do

    before do
       @user = FactoryBot.build(:user)
    end


    describe 'ユーザー新規登録' do

      context '新規登録がうまくいく時' do
         it 'passwordが半角英数字を含み6文字以上であれば登録できること' do
          @user.password = 'abc123'
          @user.password_confirmation = 'abc123'
          expect(@user).to be_valid
          end

         it 'last_nameが全角であれば登録できること' do
         @user.last_name = '谷藤'
         expect(@user).to be_valid
         end

         it 'first_nameが全角であれば登録できること' do
         @user.first_name = '聡'
         expect(@user).to be_valid
         end

         it 'last_name_kanaは全角カタカナであれば登録できること' do
         @user.last_name_kana = 'タニフジ'
         expect(@user).to be_valid
         end

         it 'first_name_kanaが全角カタカナであれば登録できること' do
         @user.first_name_kana = 'サトシ'
         expect(@user).to be_valid
         end
      end
          
      context '新規登録がうまくいかないとき' do

          it 'nicknameが空では登録できない' do
         @user.nickname = ''
         @user.valid?
         expect(@user.errors.full_messages).to include("Nickname can't be blank")
         end

         it 'emailが空では登録できない' do
         @user.email = ''
         @user.valid?
         expect(@user.errors.full_messages).to include("Email can't be blank")
         end

         it 'passwordが空では登録できない' do
         @user.password = ''
         @user.valid?
         expect(@user.errors.full_messages).to include("Password can't be blank")
         end
    
        it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
    
        it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
        end
    
        it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
    
        it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
    
        it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
    end    
end
end