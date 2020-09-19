class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @item = Item.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def update
  end

  private
  def order_params
    params.require(:order).permit(:status)
    # 注文商品？
  end
end
