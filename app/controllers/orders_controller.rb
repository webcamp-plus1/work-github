class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def cnfirm
  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    if @order.save
      render 'confirm'
    else
      @orders = Order.all
      redirect_to request.referer
    end
  end

  def done
  end

  def index
  end

  def show
  end


  private
    def order_params
      params.require(:order).permit(:addressee, :postal_code, :delivery_target_address, :payment_method)
    end
end
