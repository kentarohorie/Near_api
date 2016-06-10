class CreateUserRooms < ActiveRecord::Migration
  def change
    create_table :user_rooms do |t|
      t.references :user
      t.references :room
      t.timestamps null: false
    end
  end
end
