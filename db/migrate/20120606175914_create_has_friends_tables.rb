class CreateHasFriendsTables < ActiveRecord::Migration
  def self.up
    create_table :friendships, :force => true do |t|
      t.references :user, :friend, :friendship_message
      t.datetime :requested_at, :accepted_at
      t.string :status
      t.timestamps
    end
    
    add_index :friendships, :user_id
    add_index :friendships, :friend_id
    add_index :friendships, :status
    
    create_table :relation_types, :force => true do |t|
      t.string :name
      t.timestamps
    end
    
    add_index :relation_types, :name
    
    create_table :friendship_messages, :force => true do |t|
      t.string :body
      t.timestamps
    end
    
    create_table :friendship_relation_types, :force => true do |t|
      t.references :relation, :friendship
      t.timestamps
    end
    
    add_column :users, :friends_count, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :users, :friends_count
    
    drop_table :friendship_relation_types
    drop_table :friendship_messages
    drop_table :relation_types
    drop_table :friendships
  end
end
