class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :votes, :follower_id
    add_index :votes, :followed_id
    add_index :votes, [:follower_id, :followed_id], unique: true

  end
end
