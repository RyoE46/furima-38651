FactoryBot.define do
  factory :user do
    nickname,           
    email,              { Faker::Internet.free_email }
    password,           
    ltast_name,         
    first_name,         
    last_name_kana,     
    first_name_kana,    
    birthday,           { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end