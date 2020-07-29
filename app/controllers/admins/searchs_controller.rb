class Admins::SearchsController < ApplicationController
  before_action :authenticate_admin!

  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @records = search_for(@model, @content)
  end

  private

  def search_for(model, content)
    if model == 'member'
      Member.where('(last_name LIKE ?) OR (first_name LIKE ?) OR (last_name_kana LIKE ?) OR (first_name_kana LIKE ?)', '%' + content + '%', '%' + content + '%', '%' + content + '%', '%' + content + '%')
    elsif model == 'item'
      Item.where('name LIKE ?', '%' + content + '%')
    end
  end
end
