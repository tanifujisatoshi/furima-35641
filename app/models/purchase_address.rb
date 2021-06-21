class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id
  with_options presence: true do
  validates :postal_code, format: { with: /\A^\d{3}-\d{4}$\z/ }
  #format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city
  validates :addresses
  validates :phone_number, format: { with: /\A0\d{9,10}\z/ }
  validates :item_id
  validates :user_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number,  purchase_id: purchase.id)

  end

end