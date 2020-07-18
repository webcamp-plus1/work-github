class ChangeDataIsisVoidFlagToGenres < ActiveRecord::Migration[5.2]
  def change
  	change_column :genres, :is_void_flag, :boolean, default: true, null: false
  end
end
