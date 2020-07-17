class RemoveIsUnsubscribeStatusFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :is_unsubscribe_status, :boolean
  end
end
