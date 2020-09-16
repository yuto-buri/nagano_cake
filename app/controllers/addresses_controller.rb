class AddressesController < ApplicationController
  def edit
  	address = Address.find(params[:id])
  end

  def index
  	@addresses = Address.all
  end

  def create
  	address = Address.new(address_params)
  end

  def update
  	address = Address.find(params[:id])
  	address.update(address_params)
  	redirect_to
  end

  def destroy
  	address = Address.find(params)
  	address.destroy(address_params)
  	redirect_to
  end

  private
  def address_params
  	params.require(:address).permit(:customer_id,:name,:postal_code,:address)
  end
end
