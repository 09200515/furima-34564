class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_cord, :shipping_area_id, :city, :address_line1, :address_line2, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :item_id
    validates :shipping_area_id, numericality: { other_than: 1, message: 'select' }
    validates :city
    validates :address_line1
    validates :phone_number
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Delivery.create(postal_cord: postal_cord, shipping_area_id: shipping_area_id, city: city, phone_number: phone_number, address_line1: address_line1, address_line2: address_line2, order_id: order.id)
  end
end