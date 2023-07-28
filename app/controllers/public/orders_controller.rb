class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.find(params[:id])
  end

  def create
    @order = Order.new(order_params)

    @order.save
      @cart_items = current_customer.cart_items.all



      @cart_items.each do |cart_item|
			order_detail = OrderDetail.new
			order_detail.order_id = @order.id
			order_detail.item_id = cart_item.item.id
			order_detail.quantity = cart_item.quantity
		# 	order_detail.making_status = 0
			order_detail.price = (cart_item.item.tax_excluded_price * 1.1).floor
			order_detail.save
		end 
　　　　 current_customer.cart_items.destroy_all
     end





  def index
    @orders = Order.all
  end

  def show
    # @cart_item = CartItem current_customer.cart_items.build(cart_item_params)
    # @cart_item.save
       @order = Order.find(params[:id])
       @order_details = @order.order_details
  end

  def confirm
   

  	

		# # ご自身の住所が選択された時
		# if params[:a_method] == 0

		# @order = Order.new(order_params)
  #   @order.postcode = current_customer.postcode
  #   @order.address = current_customer.address
  #   @order.name = current_customer.first_name + current_customer.last_name

		# # 登録済住所が選択された時
		
	
		# elsif params[:a_method] == 1

		# @order = Order.new(order_params)
    @address = Address.find(params[:id])
  #   @order.postcode = @address.postcode
  #   @order.address = @address.address
  #   @order.address = @address.name

		# # 新しいお届け先が選択された時
		# elsif params[:a_method] == 2

		# @order = Order.new(order_params)

		# end

	  @order = Order.new(order_params)
    @cart_items = CartItem.all


    @total_price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

def complete

end



  private
  def order_params
    params.require(:order).permit(:a_method, :payment_method, :address, :postcode, :name)

  end



end