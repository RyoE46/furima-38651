class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item
  def index
  end

  def new
    @shipping_order = ShippingOrder.new
  end

  def create
    @shipping_order = ShippingOrder.new(order_params)
    if @shipping_order.valid?
      @shipping_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shipping).permit(:post_code, :area_id, :city, :addres, :building ,:phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
