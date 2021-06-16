class Item < ApplicationRecord
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :sales_status_id, presence: true
  validates :shipping_fee_status, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_delivery_id, presence: true

  belongs_to :user 
  has_one :purchase
  has_one_attached :image

end
