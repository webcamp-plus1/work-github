class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
	def index
		if request.referer&.include?("/admins/member")
			count_order = Order.where('created_at > ?', Time.current.beginning_of_day).where('created_at < ?', Time.current.end_of_day)
    	@orders = count_order.page(params[:page]).reverse_order
		else
			@orders = Order.page(params[:page]).reverse_order
  	end 
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

