FactoryBot.define do
  factory :order_address do
    token            { 'tok_abcdefghijk00000000000000000' }
    postal_code      { '123-1234' }
    prefectures_id   { 2 }
    municipality     { '札幌市' }
    address          { '1-1-1' }
    building_name    { 'ビル' }
    phone_number     { '09012345678' }

    association :user
    association :item
  end
end
