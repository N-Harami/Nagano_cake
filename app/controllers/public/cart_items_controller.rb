class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!


  def index
    @cart_items = current_customer.cart_items
    @total = 0
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    
  end

  def create






    @cart_items_new = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])
    if @cart_items_new
      
     @cart_items_new.quantity += params[:cart_item][:quantity].to_i
    @cart_items_new.save
    redirect_to public_cart_items_path


    else
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.customer_id = current_customer.id
   @cart_item.save
    end
  end



  def update
  #   cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])

  # cart_item.update(cart_item_params)
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path


  end
 


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path

  end

  def destroy_all
    @cart_item = current_customer
    CartItem.destroy_all
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end



end
