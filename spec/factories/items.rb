FactoryBot.define do
  factory :item do
    name              { 'てすと' }
    content           { Faker::Lorem.sentence }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id       { '2' }
    condition_id      { '2' }
    charge_id         { '2' }
    area_id           { '2' }
    delivery_id       { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
