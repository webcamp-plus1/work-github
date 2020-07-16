class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to request.referer
    else
      @delivery = Delivery.all
      redirect_to request.referer
    end
  end

  def destroy
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
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
