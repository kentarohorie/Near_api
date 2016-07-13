class AddCulumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :greeting, :string
    add_column :users, :address, :string
    add_column :users, :status, :string
    add_column :users, :location, :string
    add_column :users, :age, :integer
    add_column :users, :login_time, :integer
    add_column :users, :facebook_id, :integer
  end
end
