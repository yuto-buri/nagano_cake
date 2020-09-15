class CartItemsController < ApplicationController
  def index
  	cart_items = CartItem.all
  end

  def update
  	cart_item = CartItem.find(params[:id])
  	cart_item.update(cart_item_params)
  end

  def destroy
  	cart_item = CartItem.find(params[:id])
  	cart_item.destroy
  	redirect_to
  end

  def destroy_all
  end

  def create
  	@cart_item = CartItem.new(cart_item_params)
  	@cart_item.save
  	redirect_to
  end

  private
  def cart_item_params
  	params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end
end
