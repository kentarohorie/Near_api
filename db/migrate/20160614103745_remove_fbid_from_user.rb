class RemoveFbidFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :facebook_id, :integer
  end
end
