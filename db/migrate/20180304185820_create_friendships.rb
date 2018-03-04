class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.integer :me_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
