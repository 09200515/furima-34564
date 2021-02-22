class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
    with_options numericality: { other_than: 1, message: 'select' } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :shipping_area_id
      validates :shippment_id
    end
  end

  belongs_to :user
  has_one_attached :image

  belongs_to :prefecture
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :shippment
end
