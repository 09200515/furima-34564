FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    category_id { '4' }
    status_id { '4' }
    delivery_fee_id { '4' }
    shipping_area_id { '4' }
    shippment_id { '4' }
    price { '5000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    end
  end
end
