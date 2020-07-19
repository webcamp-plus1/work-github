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
	end

	def update
	end

	private
	def item_params
        params.require(:item).permit(:image, :name, :description, :genre_id, :tax_excluded_price, :is_sales_status)
    end
end
