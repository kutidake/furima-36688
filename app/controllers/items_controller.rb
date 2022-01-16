class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
    # @item = Item.find(params[:item_id])
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
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
    @item = Item.find(params[:id])
    @item.destroy
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image,:item_name, :explanation, :category_id, :condition_id, :charge_id, :area_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end