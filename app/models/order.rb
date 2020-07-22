class Order < ApplicationRecord
  belongs_to :member

  enum payment_method: { クレジットカード: 1, 銀行振り込み: 2 }


# でーたべーすには保存しないカラムの追加
  attr_accessor :d_address, :destination, :delivery_id


end
