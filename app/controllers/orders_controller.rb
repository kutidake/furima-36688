class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
  params.require(:order_address).permit(:price, :post_code, :area_id, :municipalities, :house_number, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: Item.find(params[:item_id]).price,
    card:  order_params[:token],
    currency: 'jpy'
  )
  end

  def non_purchased_item
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end