class OrdersController < ApplicationController
  def index
    @order_delivery = OrderDelivery.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end
  

  private

  def order_params
    params.require(:order_delivery).permit(:postalcord, :shipping_area_id, :city, :address_line1, :address_line2, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
