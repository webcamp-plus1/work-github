class Order < ApplicationRecord
  belongs_to :member
  has_many :order_item, dependent: :destroy

  enum payment_method: {card: 1, bank: 2 }

  attr_accessor :d_address, :destination, :ffff, :member_id

end
