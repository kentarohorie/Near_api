class AddLogintimeToUser < ActiveRecord::Migration
  def change
    add_column :users, :login_time, :string
  end
end
