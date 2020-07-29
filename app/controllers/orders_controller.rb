class OrdersController < ApplicationController
  before_action :authenticate_member!

  def new
    @order = Order.new
    @deliveries = Delivery.all
    @member_id = current_member.id
    # orenge = current_member.postal_code + current_member.address
  end

  def confirm
    @order = Order.new(order_params)
    @order.member = current_member
    @cart_items = current_member.cart_items.all
    if @order.address_selection == 'current_member'
      @order.postal_code = current_member.postal_code
      @order.delivery_target_address = current_member.address
      @order.addressee = current_member.last_name + current_member.first_name
    elsif @order.address_selection == 'registered_address'
      @registered_delivery = Delivery.find_by(id: params[:order][:member_id])
      @order.postal_code = @registered_delivery.postal_code
      @order.delivery_target_address = @registered_delivery.destination
      @order.addressee = @registered_delivery.addressee
    elsif @order.address_selection == 'new_address'
      @delivery = Delivery.new('member_id' => current_member.id,
                               'postal_code' => @order.postal_code,
                               'destination' => @order.destination,
                               'addressee' => @order.addressee)
      @order.postal_code = @order.postal_code
      @order.delivery_target_address = @order.destination
      @order.addressee = @order.addressee
      if params[:order][:postal_code] == "" || params[:order][:destination] == "" || params[:order][:addressee] == ""
        @deliveries = Delivery.all
        @member_id = current_member.id
        render 'new'
      end
    end
  end

  def create
    @order = Order.new(order_params)
    @order.member = current_member
    if @order.save!
      @cart_items = current_member.cart_items.all
      @cart_items.each do |cart_item|
        @order_items = OrderItem.new
        @order_items.order_id = @order.id
        @order_items.item_id = cart_item.item.id
        @order_items.count = cart_item.count
        @order_items.orderded_price = cart_item.item.tax_excluded_price
        @order_items.save
      end
      @delivery = Delivery.new('member_id' => current_member.id,
                               'postal_code' => @order.postal_code,
                               'destination' => @order.destination,
                               'addressee' => @order.addressee)
      @delivery.save
      current_member.cart_items.destroy_all
      redirect_to orders_done_path
    else
      render 'confirm'
    end
  end

  def done
  end

  def index
    @orders = Order.all
    @orders = Order.where(member_id: current_member.id).page(params[:page]).reverse_order.per(4)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:member_id,
                                  :addressee,
                                  :postal_code,
                                  :delivery_target_address,
                                  :payment_method,
                                  :destination,
                                  :tortal_prace,
                                  :address_selection)
  end
end
