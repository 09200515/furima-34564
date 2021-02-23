class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  #def edit
  #  @item = Item.find(params[:id])
  #end

  #def update
  #  @item = Item.new(item_params)
  #  if @item.save
  #    redirect_to root_path
  #  else
  #    render :edit
  #  end
  #end

  #def destroy
  #  @item = Item.find(params[:id])
  #  @item.destroy
  #  redirect_to root_path
  #end



  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :price, :delivery_fee_id,
                                 :shipping_area_id, :shippment_id).merge(user_id: current_user.id)
  end
end
