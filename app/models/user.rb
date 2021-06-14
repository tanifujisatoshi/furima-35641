class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  with_options presence: true do
   validates :nickname 
   validates :email, uniqueness: { case_sensitive: false }
   validates :password,  length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
   validates :first_name,  format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
   validates :last_name,  format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
   validates :first_name_kana,  format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ }
   validates :last_name_kana,  format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ }
   validates :birth_date
   
  end
end

  

