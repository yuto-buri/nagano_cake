class AddressesController < ApplicationController
  def edit
  	@address = Address.find(params[:id])
  end

  def index
    @addresses = Address.all
    
  end

  def create
  	address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save
    render 'index'
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
  	address = Address.find(params)
  	address.destroy(address_params)
  	redirect_to
  end

  private
  def address_params
  	params.require(:address).permit(:customer_id, :name,:postal_code,:delivery)
  end
end

