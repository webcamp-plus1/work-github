class OrdersController < ApplicationController
  def new
    @order = Order.new
    @deliveries = Delivery.all
    @member_id = current_member.id
    # orenge = current_member.postal_code + current_member.address
  end

  def confirm
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
  end

  def create
      @order = Order.new(order_params)
      @order.member = current_member
      if @order.save
        @cart_items = current_member.cart_items.all
        @cart_items.each do |cart_item|
          @order_items = OrderItem.new
          @order_items.order_id = @order.id
          @order_items.item_id = cart_item.item.id
          @order_items.count = cart_item.count
          @order_items.orderded_price = cart_item.item.tax_excluded_price
          @order_items.save
        end
        redirect_to orders_done_path
      else
        render 'confirm'
      end
  end


  def done
  end

  def index
    @orders = current_member.orders
    order_item = OrderItem.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.all
  end


  private
    def order_params
      params.require(:order).permit(:addressee, :postal_code, :delivery_target_address, :payment_method, :d_address, :destination, :member_id)
    end
end
