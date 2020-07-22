class Order < ApplicationRecord
  belongs_to :member

  enum payment_method: { card: 1, bank: 2 }


# でーたべーすには保存しないカラムの追加
  attr_accessor :d_address, :destination


end
