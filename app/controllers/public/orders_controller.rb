class Public::OrdersController < ApplicationController
  def new
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
end
