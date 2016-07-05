class ChangeGreetingcolumnWithUsers < ActiveRecord::Migration
  def change
    remove_column :users, :greeting
    add_column :users, :greeting, :text
  end
end
