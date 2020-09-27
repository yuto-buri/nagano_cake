class Admins::CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.page(params[:page]).per(10)

  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admins_customer_path(@customer)
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:is_deleted,:last_name,:last_name_kana,:first_name,:first_name_kana,:postal_code,:address,:email,:telephone_number)
  end
end
