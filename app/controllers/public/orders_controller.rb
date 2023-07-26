class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    
    if @order.save
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.quantity
        order_detail.price_including_tax = change_price_excluding_tax(cart_item.item.price_excluding_tax)
        order_detail.production_status = 0
        if order_detail.save
          @cart_items.destroy_all
        end
     
    redirect_to public_order_complete_path
  end 
  
  

  def index
    @address = Address.new
  end

  def show
    @cart_item = CartItem current_user.cart_items.build(cart_item_params)
    @cart_item.save
       @order = Order.find(params[:id])
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    
   if address_method == 0 
     @order = Order.new(order_params)
    @order.postcode = current_customer.postcode
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
   elsif address_method == 1
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postcode = @address.postal_code
    @order.address = @address.address
    @order.address = @address.name
    
   elsif address_method == 2
    @order = Order.new(order_params)
    binding.pry
   end
  end 

  def complete
  end
  
  
  private
  def order_params
    prams.require(:order).permit(:payment_method, :address, :postcode, :name)
  
  end


 
end 