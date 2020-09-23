class Admins::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    if params[:id] # 会員詳細から来た場合
      @orders = Customer.find(params[:id]).orders.page(params[:page]).per(10)

    elsif request.fullpath.include? "today" # TOP本日受注分から来た場合
      @orders = Order.where(created_at:  Time.zone.now.all_day).page(params[:page]).per(10)

    elsif request.fullpath.include? "yesterday" # TOP本日製作分から来た場合
      @orders = Order.where(created_at: 1.day.ago.all_day).page(params[:page]).per(10)

    else
      @orders = Order.page(params[:page]).per(10)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    orders = Order.all
    order_details = order.order_details
    order.update(order_params)
    # 注文ステータス[入金確認]=>制作ステータス[製作待ち]
    if order.status == "入金確認"
      order.order_details.each do |order_item|
        order_item.update(making_status: "製作待ち")
      end
    elsif params[:order_details][:making_status] == "製作中"
      order.update(status: "製作中")
    elsif params[:order_details][:making_status] == "製作完了"
        order.update(status: "発送待ち")
    end
    flash[:notice] = "You have updated status successfully."
    redirect_to admins_order_path(order.id)
  end


  private

  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
