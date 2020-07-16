class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :genre, foreign_key: true
      t.string :name
      t.boolean :is_sales_status
      t.string :description
      t.integer :tax_excluded_price
      t.string :image_id

      t.timestamps
    end
  end
end
