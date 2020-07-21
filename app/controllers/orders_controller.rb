class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def cnfirm
  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    if @order.d_address == 'current_member'
      @order.delivery_target_address = current_member.postal_code + current_member.address 
      @order.addressee = current_member.last_name + current_member.first_name     
    elsif @order.d_address == 'deliveries'
    *  @order.delivery_target_address = current_member.postal_code + current_member.address 
    *  @order.addressee = current_member.last_name + current_member.first_name     
      
    elsif @order.d_address == 'new_deli'
    * @order.delivery_target_address = current_member.postal_code + current_member.address 
    *@order.addressee = current_member.last_name + current_member.first_name  
      
      @delivery = Delivery.new('member_id' => current_member.id, 'postal_code' => @order.postal_code, 'destination' => @order.destination)
      @delivery.save
    end
    if @order.save
      redirect_to request.referer
    else
      @orders = Order.all
      redirect_to request.referer
    end
  end

  def done
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end


  private
    def order_params
      params.require(:order).permit(:addressee, :postal_code, :delivery_target_address, :payment_method, :d_address, :destination)
    end
end
