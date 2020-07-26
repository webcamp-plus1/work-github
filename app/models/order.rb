class Order < ApplicationRecord
  belongs_to :member
  has_many :order_items, dependent: :destroy

  enum payment_method: {card: 1, bank: 2 }
  enum status: {waiting: 1, confirm: 2, in_production: 3, preparing: 4, done: 5 }

  attr_accessor :d_address, :destination, :ffff, :member_id

end
