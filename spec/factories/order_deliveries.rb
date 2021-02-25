FactoryBot.define do
  factory :order_delivery do
    postal_cord { '123-4567' }
    shipping_area_id { 4 }
    city { '東京都' }
    address_line1 { '1-1' }
    address_line2 { 'グランドビル' }
    phone_number { '09011223344' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 2 }
  end
end
