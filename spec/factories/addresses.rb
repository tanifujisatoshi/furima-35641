FactoryBot.define do
  factory :address do
    postal_code              { '024-0333' }
    prefecture_id                   { '3' }
    city                { '北上市和賀町長沼' }
    addresses                { '3地割14番地5' }
    building                     { '建物名' }
    phone_number           { '07020378633' }
    association :purchase
  end
end
