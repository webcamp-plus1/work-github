class RenamePstalColumnToDeliveries < ActiveRecord::Migration[5.2]
  def change
  	rename_column :deliveries, :pstal_code, :postal_code
  end
end
