class CartsController < ApplicationController
  before_action :authenticate_member!

  def create
    cart_item = CartItem.find_by(member_id: current_member.id, item_id: params[:cart_item][:item_id])
    if cart_item
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
    @cart_items = current_member.cart_items
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
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to request.referer
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:count, :item_id)
  end
end