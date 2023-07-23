class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @items = Item.all
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

def destroy
  item = Item.find(params[:id])
  item.destroy
  redirect_to admin_items_path
end

  private

  def item_params
    params.require(:item).permit(:name, :description, :tax_excluded_price, :image, :is_sale_status)

  end
end
