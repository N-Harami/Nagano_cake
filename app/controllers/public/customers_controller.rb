class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
    @addresses = @customer.addresses
    @order = @customer.order
  end

  def edit
    @customer = current_customer
  end

   def withdraw
    @customer = current_customer
    @customer.withdrawal_status = true
    if @customer.save
      reset_session
      redirect_to root_path
    end
   end

  def check
  end

  def update
    #@customer = current_customer
     @customer = Customer.find(params[:id])
     if @customer.update(customer_params)
     redirect_to public_customers_mypage_path
     else
     render "edit"
     end

   private

   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
   end

  end
end
