class OrdersController < ApplicationController
  def index
    @order_delivery = OrderDelivery.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
      return
    else
      render :index
    end
  end
  

  private

  def order_params
    params.require(:order_delivery).permit(:postal_cord, :shipping_area_id, :city, :address_line1, :address_line2, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_596590d0dba39c027d0982ba"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
