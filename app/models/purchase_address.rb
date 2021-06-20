class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id
  with_options presence: true do
  validates :postal_code
  validates :prefecture_id
  validates :city
  validates :addresses
  validates :phone_number 
  validates :item_id
  validates :user_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(purchase_id: purchase.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, addresses: addresses, building: building, phone_number: phone_number )

  end

end