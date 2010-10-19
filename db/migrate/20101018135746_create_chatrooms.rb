class CreateChatrooms < ActiveRecord::Migration
  def self.up
    create_table :chatrooms do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :chatrooms
  end
end
