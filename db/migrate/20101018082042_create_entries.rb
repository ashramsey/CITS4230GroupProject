class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :chatroom_id
      t.integer :user_id
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
