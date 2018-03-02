class RemoveFriendFromFriendships < ActiveRecord::Migration[5.1]
  def change
    remove_reference :friendships, :friend, foreign_key: true
  end
end
