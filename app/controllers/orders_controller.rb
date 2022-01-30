class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to action: :index
    else
      render :index
    end
  end

  private
  def order_params
  params.require(:order_address).permit(:post_code, :area_id, :municipalities, :house_number, :building, :telephone,:order_id)
end

end