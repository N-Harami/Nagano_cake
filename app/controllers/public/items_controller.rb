class Public::ItemsController < ApplicationController
  def index
    @items_all = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = Cart_item.new
  end
end
