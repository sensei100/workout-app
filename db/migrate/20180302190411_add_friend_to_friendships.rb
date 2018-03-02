class AddFriendToFriendships < ActiveRecord::Migration[5.1]
  def change
    add_column :friendships, :friend_id, :string
    add_index :friendships, :friend_id
  end
end
