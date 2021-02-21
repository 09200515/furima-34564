class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

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
  
  belongs_to :prefecture
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :shippment
end
