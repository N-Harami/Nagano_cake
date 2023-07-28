class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetails.find(params[:order_id])
  end

  def update

  end

end
