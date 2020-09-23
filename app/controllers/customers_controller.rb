class CustomersController < ApplicationController
  def edit
    @customer = Customer.find(current_customer.id)
  end

  def show
  	@customer = current_customer
  end

  def update
  	@customer = current_customer
  	if @customer.update(customer_params)
      redirect_to customers_path
    else
      render 'edit'
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, info: 'ありがとうございました。またのご利用を心よりお待ちしております。'
  end

  private
    # ストロングパラメータ
    def customer_params
      params.require(:customer).permit(:is_deleted, :last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number)
    end


end
