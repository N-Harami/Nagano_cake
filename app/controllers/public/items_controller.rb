class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = Cart_item.new
  end
end
