class Admins::ItemsController < ApplicationController

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to admins_items_path
		else
			render action: :new
		end
	end

	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	 def edit
	 	@item = Item.find(params[:id])
	 end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_items_path
    else
      redirect_to request.referer
    end
  end

	private
	def item_params
        params.require(:item).permit(:image, :name, :description, :genre_id, :tax_excluded_price, :is_sales_status)
    end
end
