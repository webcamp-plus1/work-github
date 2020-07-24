class ChangeDataStatusToOrder < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :status, :integer, default: 1
  	change_column :order_items, :production_status, :integer, default: 1
  end
end
