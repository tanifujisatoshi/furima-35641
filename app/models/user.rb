class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: { with: /\p{katakana}/ }
  validates :last_name_kana, presence: true, format: { with: /\p{katakana}/ }
  validates :birth_date, presence: true

  has_many :items
  has_many :purchases

end
