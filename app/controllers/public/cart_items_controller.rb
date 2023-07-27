class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!


  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

  def create






    @cart_items = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])
    if @cart_items
      
     @cart_items.quantity += params[:cart_item][:quantity].to_i
    @cart_items.save
    redirect_to public_cart_items_path


    else
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.customer_id = current_customer.id
   @cart_item.save
    end
  end



  def update

  @cart_item.update
    redirect_to public_cart_items_path


    end


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path

  end

  def destroy_all
    @cart_item = current_cart_item
    @cart_item.destroy_all
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end



end
