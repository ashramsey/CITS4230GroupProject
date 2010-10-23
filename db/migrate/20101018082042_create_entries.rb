class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :chatroom_id
      t.string  :chatroom_name
      t.integer :user_id
      t.string  :user_name
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
