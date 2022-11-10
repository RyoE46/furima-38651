FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name

    nickname,           { japanese_user.kanji }
    email,              { Faker::Internet.free_email }
    password,           { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    last_name,          { japanese_user.last.kanji }
    first_name,         { japanese_user.first.kanji }
    last_name_kana,     { japanese_user.last.katakana }
    first_name_kana,    { japanese_user.first.katakana }
    birthday,           { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end