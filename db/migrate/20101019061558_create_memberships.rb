class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.integer :user_id
      t.string  :user_name
      t.integer :chatroom_id
      t.string  :chatroom_name

      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
  end
end
