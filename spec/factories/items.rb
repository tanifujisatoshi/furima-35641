FactoryBot.define do
  factory :item do
    name = Faker::Name.name  (max_length: 40)
    info = Faker::Name.name  (max_length: 1000)              
    category_id              { 2 }
    sales_status_id          { 2 }
    shipping_fee_status_id   { 2 }
    scheduled_delivery_id    { 2 }
    prefecture_id            { 2 }
    price = Faker :: Number.between （from：300、 to：9999999 ） 
      
  end
end
