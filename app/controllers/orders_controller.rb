class OrdersController < ApplicationController

  def new
    @address = Address.where(customer_id:current_customer.id)
    @my_address = Customer.find(current_customer.id)
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address] == "1"
      @my_address = Customer.find(current_customer.id)
      @order.postal_code = @my_address.postal_code
      @order.address = @my_address.address
      order_last_name = @my_address.last_name
      order_first_name = @my_address.first_name
      @order.name = order_last_name + order_first_name
    elsif params[:order][:address] == "2"
      @address = Address.find(params[:order][:id])
      @order.name = @address.name
      @order.address = @address.delivery
      @order.postal_code = @address.postal_code
    elsif params[:order][:address] == "3"
      @order.name = params[:order][:new_address][:name]
      @order.address = params[:order][:new_address][:delivery]
      @order.postal_code = params[:order][:new_address][:postal_code]

    end
    @new = params[:order][:new_address][:postal_code]
    @order.total_price = calculate(current_customer)
    
  end





  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.amount = cart_item.amount
      @order_detail.making_status = 0
      @order_detail.price = (cart_item.item.price * cart_item.amount * 1.1).floor
      @order_detail.save
    end
    current_customer.cart_items.delete_all
    redirect_to order_complete_path
  end

  def index
    @orders = Customer.find(current_customer.id).orders.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :total_price, :shipping_cost, :payment, :status, :postal_code, :address, :name)
  end

  def calculate(customer)
    total_price = 0
    customer.cart_items.each do |cart_item|
      total_price += cart_item.amount * cart_item.item.price
    end
    return (total_price * 1.1).floor
  end

end