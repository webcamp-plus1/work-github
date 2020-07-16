class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.member_id = current_member.id
    if @delivery.save
      redirect_to request.referer
    else
      @delivery = Delivery.all
      redirect_to request.referer
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to request.referer
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path(current_member)
    else
      redirect_to request.referer
    end
  end

  private
  def delivery_params
    params.require(:delivery).permit(:postal_code, :destination, :addressee)
  end
end
