class Delivery < ApplicationRecord
  with_options presence: true do
    validates :postal_cord
    validates :shipping_area_id
    validates :city
    validates :address_line1
    validates :phone_number
  end

  belongs_to :order
end
