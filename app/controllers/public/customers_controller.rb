class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = Customer.find(params[:id])
    @addresses = @customer.addresses
    @order = @customer.order
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    redirect_to public_customers_mypage_path
    else
    render "edit"
    end
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

   private

   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
   end
end
