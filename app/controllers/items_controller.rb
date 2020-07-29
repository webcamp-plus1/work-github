class ItemsController < ApplicationController

  def index
    @genres = Genre.where(is_void_flag: true)
    @ary = Array[@genres]
    # [
    #   Genre.find(1),
    #   Genre.find(2),
    #   Genre.find(2),
    # ]
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).reverse_order
    else
    	@items = Item.where(genre_id: @ary).page(params[:page]).reverse_order
    end
  end

  def show
    @item = Item.find(params[:id])
    if member_signed_in?
      if current_member.cart_items.find_by(item_id: @item.id)
        @item_post = current_member.cart_items.find_by(item_id: @item.id)
      else
        @item_post = CartItem.new
      end
    else
      @item_post = CartItem.new
    end
    @genres = Genre.all
  end

  def search
    @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).reverse_order
    @genres = Genre.where(is_void_flag: true)
    @genre = Genre.find(params[:genre_id])
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:count)
  end
end
