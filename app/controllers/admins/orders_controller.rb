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

	def member_orders
		@member = Member.find(params[:id])
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
    @order = Order.find(params[:id])
	  if @order.update(order_params)
	  	if @order.status == 'confirm'
	  		@order.order_items.each do |order_item|
		  		order_item.update(production_status: "waiting")
		  	end
	  	end
	  end
	  redirect_to request.referer
  end

  private
  def order_params
  	params.require(:order).permit(:status)
  end
end

