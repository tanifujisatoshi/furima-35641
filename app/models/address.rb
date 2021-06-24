class Address < ApplicationRecord

  validates :postal_code, presence: true
  validates :postal_code, presence: true, format: { with: /\A^\d{3}-\d{4}$\z/ }
  validates :prefecture_id, numericality: { other_than: 1 }, presence: true
  validates :city, presence: true
  validates :addresses, presence: true
  validates :phone_number, presence: true
  validates :phone_number, presence: true, format: { with: /\A0\d{9,10}\z/ }


  belongs_to :purchase
end