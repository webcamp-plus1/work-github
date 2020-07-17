class AddIsUnsubscribeStatusToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :is_unsubscribe_status, :boolean, default: false, null: false
  end
end
