class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
  end

  def update

  end
  
  private
  
  def order_params
    params.require(:order).permit(:cuttomer_id, :payment_methods, :postcode, :address, :name, :shipping_fee, :billing_amount, :order_status)
  end
end
