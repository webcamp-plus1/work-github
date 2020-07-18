class CartsController < ApplicationController
   def create
    @item = Item.find(params[:id])
    cart_item = current_member.cart_items.new(cart_item_params)
    cart.save
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
