class ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).reverse_order
  	@genres = Genre.all
  end

  def show
  end
end
