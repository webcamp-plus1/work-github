class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum production_status: {not_possible: 1, waiting: 2, in_production: 3, done: 4 }
  attr_accessor :name

end
