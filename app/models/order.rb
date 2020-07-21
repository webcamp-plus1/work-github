class Order < ApplicationRecord
  belongs_to :member

  enum payment_method: { card: 1, bank: 2 }
end
