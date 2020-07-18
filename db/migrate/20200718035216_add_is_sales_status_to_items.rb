class AddIsSalesStatusToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :is_sales_status, :boolean, default: true, null: false
  end
end
