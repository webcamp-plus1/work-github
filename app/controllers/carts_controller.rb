class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    cart_item = current_member.cart_items.new(item_id: item.id)
    cart_item.save
    redirect_to request.referer
  end

  def index
    @cart_items = CartItem.all
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:count)
  end
end
