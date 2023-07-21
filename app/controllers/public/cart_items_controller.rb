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
  end 
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end 
end
