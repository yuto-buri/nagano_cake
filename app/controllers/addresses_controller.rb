class AddressesController < ApplicationController
  def edit
  	@address = Address.find(params[:id])
  end

  def index
    @addresses = Address.all
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def create
  	address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save
    redirect_to customers_addresses_path
  end

  def update
  	   @address = Address.find(params[:id])
  	if @address.update(address_params)
  	   redirect_to customers_addresses_path
    else
       @address = Address.find(params[:id])
       render 'edit'
    end
  end

  def destroy
  	address = Address.find(params[:id])
  	address.destroy
  	redirect_to request.referrer
  end

  private
  def address_params
  	params.require(:address).permit(:customer_id, :name,:postal_code,:delivery)
  end
end

