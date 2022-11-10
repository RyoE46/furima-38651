FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name

    nickname,           
    email,              { Faker::Internet.free_email }
    password,           
    last_name,          { japanese_user.last.kanji }
    first_name,         { japanese_user.first.kanji }
    last_name_kana,     { japanese_user.last.katakana }
    first_name_kana,    { japanese_user.first.katakana }
    birthday,           { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end