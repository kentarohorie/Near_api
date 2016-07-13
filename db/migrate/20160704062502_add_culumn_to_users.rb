class AddCulumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :work, :string, default: ""
    add_column :users, :school, :string, default: ""
  end
end
