class ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).reverse_order
  	@genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    if current_member.cart_items.find_by(item_id: @item.id)
       @item_post = current_member.cart_items.find_by(item_id: @item.id)
     else
       @item_post = CartItem.new
     end
  end


   private
  def cart_item_params
    params.require(:cart_item).permit(:count)
  end
end
