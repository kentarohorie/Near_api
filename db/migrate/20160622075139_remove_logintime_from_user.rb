class RemoveLogintimeFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :login_time, :int
  end
end
