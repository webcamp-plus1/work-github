class ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).reverse_order
  	@genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @item_post = Item.new
  end


   private
  def cart_item_params
    params.require(:cart_item).permit(:count)
  end
end
