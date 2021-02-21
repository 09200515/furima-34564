class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :price
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :shippment_id
  end

  belongs_to :user
  has_one_attached :image
end
