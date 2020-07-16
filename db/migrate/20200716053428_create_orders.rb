class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :member, foreign_key: true
      t.string :addressee
      t.string :postal_code
      t.string :delivery_target_address
      t.integer :payment_method
      t.integer :status
      t.integer :fee
      t.integer :tortal_prace

      t.timestamps
    end
  end
end
