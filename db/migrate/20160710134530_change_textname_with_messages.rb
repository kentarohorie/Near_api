class ChangeTextnameWithMessages < ActiveRecord::Migration
  def change
    add_column :messages, :message, :string
    remove_column :messages, :text
  end
end
