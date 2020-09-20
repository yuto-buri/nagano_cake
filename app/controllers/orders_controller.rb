class OrdersController < ApplicationController

  def new
    @address = Address.where(customer_id:current_customer.id)
    @my_address = Customer.find(current_customer.id)
    @order = Order.new
  end

  def confirm
    @new = params[:order][:new_address][:postal_code]
  end

  def complete
  end

  def create
    session[:payment] = params[:payment]
    if params[:select] == "select_address"
      session[:address] = params[:address]
    elsif params[:select] == "my_address"
      session[:address] ="〒" +current_customer.post_code+current_customer.address+current_customer.last_name+current_customer.first_name
    end
    if session[:address].present? && session[:payment].present?
      redirect_to orders_confirm_path
    else
      flash[:order_new] = "支払い方法と配送先を選択して下さい"
      redirect_to order_complete_path
    end
  end

  def index
    @orders = Order.where(customer_id:current_customer)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end


  private

  def order_params
  params.require(:order).permit(:customer_id, :order_detail_id, :total_price, :shipping_cost, :status, :postal_code, :address, :name)
  end

end