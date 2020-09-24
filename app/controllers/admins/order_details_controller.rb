class Admins::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.making_status == "製作中"
      @order = Order.where(status: "入金確認")
      @order.update(status: "製作中")
      redirect_back(fallback_location: root_path)
    else
      @order_details = OrderDetail.where.not(making_status: "製作完了").where(order_id: @order_detail.order_id)
      if @order_details.empty?
        @order = Order.where(status: "製作中", id: @order_detail.order_id).first
        if @order.present?
          @order.update(status: "発送準備中")
        end
      end
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end

#class Admins::OrderDetailsController < ApplicationController

  #def update
    #@order_detail = OrderDetail.find(params[:id])
    #@order_detail.update(order_detail_params)
    #if @order_detail.making_status == "製作中"
      #@order = Order.where(status: "入金確認")
  #     @order.update(status: "製作中")
  #     redirect_back(fallback_location: root_path)
  #   else

  #     order_id = @order_detail.order_id
  #     @order = Order.find(order_id)
  #     all_item_length = order.order_details.length
  #     # all_item_length = OrderDetails.where(order_id: order_id).length

  #     # @order.order_details == OrderDetails.where(order_id: order_id) # 挙動は一緒

  #     completed_item_length = OrderDetails.where(making_status: "製作完了", order_id: order_id).length
  #     # completed_item_length = @order.order_details.where(making_status: "製作完了").length

  #     if all_item_length == completed_item_length
  #       if @order.status == "製作中"
  #         @order.update(status: "発送準備中")
  #       end
  #     end
  #     redirect_back(fallback_location: root_path)

  #     # @order_details = OrderDetail.where.not(making_status: "製作完了").where(order_id: @order_detail.order_id)
  #     # if @order_details.empty?
  #     #   @order = Order.where(status: "製作中", id: @order_detail.order_id).first
  #     #   if @order.present?
  #     #     @order.update(status: "発送準備中")
  #     #   end
  #     # end
  #     # redirect_back(fallback_location: root_path)
  #   end
  # end

  # private
  # def order_detail_params
  #   params.require(:order_detail).permit(:making_status)
  # end

# end