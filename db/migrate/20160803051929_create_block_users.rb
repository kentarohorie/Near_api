class CreateBlockUsers < ActiveRecord::Migration
  def change
    create_table :block_users do |t|
      t.string :user_id
      t.string :blocked_user_id
      t.timestamps null: false
    end
  end
end
