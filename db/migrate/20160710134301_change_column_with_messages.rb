class ChangeColumnWithMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :user_id
    add_column :messages, :user_id, :string
  end
end
