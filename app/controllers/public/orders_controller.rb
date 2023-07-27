class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to public_order_confirm_path
  end



  def index
    @address = Address.new
  end

  def show
    @cart_item = CartItem current_user.cart_items.build(cart_item_params)
    @cart_item.save
  end

  def confirm
  end

  def complete
  end
  private
  def order_params
    prams.require(:order).permit(:address, :postcode, :name)

end
end
