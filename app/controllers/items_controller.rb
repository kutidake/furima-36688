class ItemsController < ApplicationController

  private

  def item_params
    params.require(:item).permit(:nickname, :last_name, :last_name_f, :first_name, :first_name_f, :birth).merge(user_id: current_user.id)
  end
end