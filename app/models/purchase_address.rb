class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :purchase_id
  with_options presence: true do
  validates :postal_code
  validates :prefecture_id
  validates :city
  validates :addresses
  validates :phone_number
  end

end