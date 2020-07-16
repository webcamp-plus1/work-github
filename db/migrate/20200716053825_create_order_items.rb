class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :production_status
      t.integer :orderded_price
      t.integer :count

      t.timestamps
    end
  end
end
