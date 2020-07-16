class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.references :member, foreign_key: true
      t.string :addressee
      t.string :pstal_code
      t.string :destination

      t.timestamps
    end
  end
end
