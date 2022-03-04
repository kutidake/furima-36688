class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit,:update]
  def index
    @items = Item.all.order("created_at DESC")
    # @item = Item.find(params[:item_id])
  end

  def new
    @item = Item.new
  end
  

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
    @item.destroy
  end
  redirect_to root_path
  end

  def edit
    if @item.order.present?
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :charge_id, :area_id, :scheduled_delivery_id, :price, {images: []}).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
     if @item.user_id != current_user.id
     redirect_to action: :index
     end
  end
end