class Admins::CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    if @customer.update(customer_params)
      redirect_to admins_customer_path(@customer)
    else
      render :show
    end
  end

  private
  def customer_params
    params.require( :first_name, :last_name,
                    :first__name_kana, :last_name_kana,
                    :email,
                    :postal_code,
                    :address,
                    :telephone_number,
                    :is_deleted
    )
  end


end
