class Admins::OrderItemsController < Admins::OrdersController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      if @order_item.production_status == 'in_production'
        @order_item.order.update(status: "in_production")
      # @order_item.order.status = 'in_production'
      # @order_item.order.update
      elsif @order_item.order.order_items.pluck(:production_status).all? { |production_status| production_status == 'done' }
        # .pluck(:カラム名)でカラムの値を全て取得。その後allメソッドで'done'を探す １つでも違うとfalseを返す
        @order_item.order.update(status: 'preparing')
        # @order_item.order.status = 'preparing'
        # @order_item.order.update
      end
    end
    redirect_to request.referer
  end

  private

  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end