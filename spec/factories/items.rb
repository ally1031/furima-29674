FactoryBot.define do
  factory :item do
   title                       {'aaa'}
   text                        {'aaa'}
   genre_id                    {2}
   status_ah_id                {2}
   shipping_charges_ah_id      {3}
   shipment_source_ah_id       {4}
   shipping_days_ah_id         {5}
   price                       {500}
   association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/Rails.test.png'), filename: 'Rails.test.png')
    end
  end
end
