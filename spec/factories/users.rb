FactoryBot.define do
  factory :user do
    nickname              { 'satoshi' }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { password }
    last_name             { '谷藤' }
    last_name_kana        { 'タニフジ' }
    first_name            { '聡' }
    first_name_kana       { 'サトシ' }
    birth_date            { Faker::Date.birthday }
  end
end
