class AddColumnToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :send_user_id, :string
    add_column :rooms, :opponent_user_id, :string
  end
end
