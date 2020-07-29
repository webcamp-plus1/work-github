class HomesController < ApplicationController
  def top
    @genres = Genre.where(is_void_flag: true)
    @ary = Array[@genres]
    # [
    #   Genre.find(1),
    #   Genre.find(2),
    #   Genre.find(2),
    # ]
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id]).all
    else
      @items = Item.where(genre_id: @ary).all
    end
  end

  def about
  end
end
