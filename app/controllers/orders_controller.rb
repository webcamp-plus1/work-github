class OrdersController < ApplicationController
  def new
    @order = Order.new
    @deliveries = Delivery.all
    @member_id = current_member.id
    # orenge = current_member.postal_code + current_member.address
  end

  def confirm
  end

  def create
    @order = Order.new(order_params)
    @order.member = current_member
    if @order.d_address == 'current_member'
      @order.postal_code = current_member.postal_code
      @order.delivery_target_address = current_member.address
      @order.addressee = current_member.last_name + current_member.first_name
    elsif @order.d_address == 'deliveries'
      @add = Delivery.find_by(id: params[:order][:member_id])
      @order.postal_code = @add.postal_code
      @order.delivery_target_address = @add.destination
      @order.addressee = @add.addressee
    elsif @order.d_address == 'new_deli'
      @delivery = Delivery.new('member_id' => current_member.id, 'postal_code' => @order.postal_code, 'destination' => @order.destination, 'addressee' => @order.addressee )
      @delivery.save
      @order.postal_code = @order.postal_code
      @order.delivery_target_address = @order.destination
      @order.addressee = @order.addressee
    end
    if @order.save
      redirect_to order_path(@order)
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
    @cart_items = CartItem.all
  end


  private
    def order_params
      params.require(:order).permit(:addressee, :postal_code, :delivery_target_address, :payment_method, :d_address, :destination, :member_id)
    end
end
