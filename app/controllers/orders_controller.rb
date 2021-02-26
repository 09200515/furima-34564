class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect, only: [:index, :create]


  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
      nil
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:postal_cord, :shipping_area_id, :city, :address_line1, :address_line2, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def redirect
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
