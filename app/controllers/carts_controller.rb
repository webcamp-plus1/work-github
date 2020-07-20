class CartsController < ApplicationController

  def create
    cart_item = CartItem.find_by(member_id: current_member.id, item_id: params[:cart_item][:item_id])

    if  cart_item
    # cart_item が存在する場合の意味（.present を省略している）
        cart_item.count += params[:cart_item][:count].to_i
      else
        cart_item = CartItem.new(cart_item_params)
        cart_item.member_id = current_member.id
      end
        cart_item.save
        redirect_to members_carts_path
   end

  def index
    @cart_items = CartItem.all
    cart_item = CartItem.find(id: cart_item.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
  end

  def all_destroy
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:count, :item_id)
  end
end
