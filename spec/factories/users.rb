FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { password }
    last_name             { '谷藤' }
    last_name_kana        { Gimei.name.last.katakana }
    first_name            { '聡' }
    first_name_kana       { Gimei.name.first.katakana }
    birth_date            { Faker::Date.birthday }
  end
end
