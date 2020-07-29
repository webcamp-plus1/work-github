class DeliveriesController < ApplicationController
  before_action :authenticate_member!

  def index
    @deliveries = current_member.deliveries
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.member_id = current_member.id
    if @delivery.save
      redirect_to request.referer
    else
      @deliveries = Delivery.all
      render :index
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path
    else
      redirect_to request.referer
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to request.referer
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postal_code, :destination, :addressee)
  end
end
