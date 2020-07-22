class OrdersController < ApplicationController
  def new
    @order = Order.new
    @deliveries = Delivery.all
    @member_id = current_member.id
    # orenge = current_member.postal_code + current_member.address
  end

  def confirm
    @cart_items = CartItem.all
  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    if @order.d_address == 'current_member'
      @order.postal_code = current_member.postal_code
      @order.delivery_target_address = current_member.address
      @order.addressee = current_member.last_name + current_member.first_name
    elsif @order.d_address == 'deliveries'
    *  @order.delivery_target_address = current_member.postal_code + current_member.address
    *  @order.addressee = current_member.last_name + current_member.first_name
    elsif @order.d_address == 'new_deli'
      @delivery = Delivery.new('member_id' => current_member.id, 'postal_code' => @order.postal_code, 'destination' => @order.destination, 'addressee' => @order.addressee )
      @delivery.save
      @order.postal_code = @order.postal_code
      @order.delivery_target_address = @order.destination
      @order.addressee = @order.addressee
    end
    if @order.save
      redirect_to order_confirm_path
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
 