class Admins::OrdersController < ApplicationController
	def index
		@orders = Order.page(params[:page]).reverse_order

	end
	def show
		@order = Order.find(params[:id])
	end

	def update
    @order = Order.find(params[:id])
	  if @order.update(order_params)
	    redirect_to admins_orders_path
	  else
	    redirect_to request.referer
	  end
  end

  private
  def order_params
  	params.require(:order).permit(:status)
  end
end

