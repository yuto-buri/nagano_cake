class CartItemsController < ApplicationController
  def index
   @cart_items = current_customer.cart_items
   @total_price = calculate(current_customer)
  end

  def update
  	cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
  	cart_item = CartItem.find(params[:id])
  	cart_item.destroy
  	redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    if current_customer
      @cart_item = current_customer.cart_items.new(cart_item_params)
      if @cart_item.save
        redirect_to cart_items_path
      else
        redirect_to items_path
      end
    else
      flash[:alert] = "※商品をカートに入れる際はログインもしくは会員登録が必要になります"
      redirect_to new_customer_session_path
    end
  end

  private
  def cart_item_params
  	params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end

  def calculate(customer)
    total_price = 0
    customer.cart_items.each do |cart_item|
      total_price += cart_item.amount * cart_item.item.price
    end
    return (total_price * 1.1).floor
  end

end
