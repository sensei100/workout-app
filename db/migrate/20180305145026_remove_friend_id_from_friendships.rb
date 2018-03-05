class RemoveFriendIdFromFriendships < ActiveRecord::Migration[5.1]
  def change
    remove_column :friendships, :friend_id, :string
  end
end
