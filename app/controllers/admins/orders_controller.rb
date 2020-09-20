class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def update

  end

  private
  def order_params
    params.require(:order).permit(:status)
    # 注文商品？
  end
end
