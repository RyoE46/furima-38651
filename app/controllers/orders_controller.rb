class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item

  def index
    @shipping_order = ShippingOrder.new
    if @item.order.present?
      redirect_to root_path
    else
      if current_user.id == @item.user_id
        redirect_to root_path
      end  
    end
  end

  def new
    @shipping_order = ShippingOrder.new
  end

  def create
    @shipping_order = ShippingOrder.new(order_params)
    if @shipping_order.valid?
      pay_item
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
    params.require(:shipping_order).permit(:post_code, :area_id, :city, :addres, :building ,:phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
