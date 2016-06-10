class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.references :user
      t.references :room
      t.timestamps
    end
  end
end
