class OrdersController < ApplicationController
  before_action :order_create, only: %i[index create]

  def index
    @order_info = OrderInfo.new
    redirect_to root_path if !user_signed_in? || current_user.id == @item.user_id || !@item.order.nil?
  end

  def create
    @order_info = OrderInfo.new(order_params)
    if @order_info.valid?
      pay_item
      @order_info.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_create
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_info).permit(:area_id, :adress_number, :city, :building_name, :house_number, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
