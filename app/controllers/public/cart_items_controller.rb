class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end
  
  def create
  end 
  
  def update
    @cart_items = cart_items.find(params[:id])
    @cart_items.update
    redirect_to public_cart_items_path
  end 
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cartitem.destroy
    redirect_to public_cart_items_path
    
  end 
  
  def destroy_all 
    @cart_items = current_cart_item
    @cart_items.destroy_all 
    redirect_to public_cart_items_path
  end 
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end 
end
