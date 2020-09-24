class Admins::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
	if @order_detail.making_status == "製作中"
		@order = Order.where(status: "入金確認")
		@order.update(status: "製作中")
		redirect_back(fallback_location: root_path)
	else @order_details = OrderDetail.where.not(making_status: "製作完了").all
		 @order_details.none? == "製作完了"
		 @order = Order.where(status: "製作中")
		 @order.update(status: "発送準備中")
		 redirect_back(fallback_location: root_path)
	end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
