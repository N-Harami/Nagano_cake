class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer.id
    @addresses = current_customer.addresses
    @order = current_customer.order
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
    redirect_to public_customers_mypage_path
    else
    render "edit"
    end
  end

   def withdraw
      @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_quit_status: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
   end


  def check
  end

   private

   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
   end
end
