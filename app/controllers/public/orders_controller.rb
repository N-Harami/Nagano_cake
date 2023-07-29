class Public::OrdersController < ApplicationController
  before_action :cartitem_nill,   only: [:new, :create]

  def new
    @order = current_customer.orders.new
  end

  def create
   @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.save

        current_customer.cart_items.each do |cart_item|
          @order_detail = OrderDetail.new
          @order_detail.item_id = cart_item.item_id
          @order_detail.quantity = cart_item.quantity
          @order_detail.price = (cart_item.item.tax_excluded_price*1.1).floor
          @order_detail.order_id =  @order.id
          @order_detail.save
        end

        current_customer.cart_items.destroy_all
        redirect_to complete_public_orders_path
  end



  def confirm
    @orders = current_customer.orders
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:addresses_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.shipname
    else
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
      @total = 0
      @cart_items = current_customer.cart_items
      @order_new = Order.new
      render :confirm
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @toral = 0
  end

  def complete
  end


private

  def order_params
    params.require(:order).permit(:customer_id, :postcode, :address, :name, :postage, :total_price, :payment_method, :orders_status)
  end

  def cartitem_nill
     cart_items = current_customer.cart_items
     if cart_items.blank?
      redirect_to public_cart_items_path
     end
  end
end