FactoryBot.define do
  factory :shipping_order do
    token        {"tok_abcdefghijk00000000000000000"}
    post_code    { '232-2343' }
    area_id      { 15 }
    city         { '横浜市緑区' }
    addres       { '山田1-2-3' }
    building     { 'テラハウス303' }
    phone_number { '09056387625'}
  end
end
