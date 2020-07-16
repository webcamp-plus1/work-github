class DeliveriesController < ApplicationController
  def index
    @deliveries = Derlivery.all
    @delivery = Delivery.new
  end

  def create
  end

  def destroy
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @user.update(delivery_params)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private
  def delivery_params
    params.require(:delivery).permit(:pstal_code, :destination, :addressee)
  end
end
