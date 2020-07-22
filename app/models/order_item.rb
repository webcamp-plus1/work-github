class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  attr_accessor :name

end
