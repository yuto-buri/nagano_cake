class AddressesController < ApplicationController
  def edit
  	address = Address.find(params[:id])
  end

  def index
    @address = Address.new
  	  end

  def create
  	@address = Address.new(address_params)
    @address.save
    redirect_to root_path
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
