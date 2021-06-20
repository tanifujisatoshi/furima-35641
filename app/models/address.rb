class Address < ApplicationRecord

  validates :postal_code, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }, presence: true
  validates :city, presence: true
  validates :addresses, presence: true
  validates :phone_number, presence: true


  belongs_to :purchase
end
