class AddIndexToFriendships < ActiveRecord::Migration[5.1]
  def change
    add_index :friendships, :me_id
    add_index :friendships, :friend_id
  end
end
