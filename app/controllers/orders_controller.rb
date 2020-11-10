class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_info = OrderInfo.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_info = OrderInfo.new(order_params)
    if @order_info.valid?
      @order_info.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_info).permit(:area_id,:adress_number,:city,:building_name,:house_number,:phone_number).merge(user_id: current_user.id,item_id: @item.id)
  end
end
