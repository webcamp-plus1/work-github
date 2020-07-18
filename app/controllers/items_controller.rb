class ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).reverse_order
  	@genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

   def create
   	@item = Item.find(params[:id])
    cart_item = current_member.cart_items.new(cart_item_params)
    cart.save
    redirect_to request.referer
  end

   private
  def cart_item_params
    params.require(:cart_item).permit(:count)
  end
end
