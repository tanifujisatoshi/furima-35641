class Item < ApplicationRecord
  with_options presence: true, numericality: { other_than: 1 } do
  validates :name
  validates :info
  validates :price
  validates :category_id
  validates :sales_status_id
  validates :shipping_fee_status_id
  validates :scheduled_delivery_id
  end

  validates :prefecture_id, presence: true

  belongs_to :user 
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status
end
