class AddUniqToVotes < ActiveRecord::Migration[5.2]
  def change
    add_index :votes, [:poll_id, :poll_option_id], unique: true
  end
end
