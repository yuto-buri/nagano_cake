class CustomersController < ApplicationController
  def edit
  end

  def show
  	customer = Customer.find(params[:id])
  end

  def withdraw
  end

  def update
  	customer = Customer.find(params[:id])
  	customer.update
  	redirect_to
  end

  def unsubscribe
  end


end
