class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.string :session_id
      t.integer :poll_id
      t.integer :poll_option_id
      t.references :poll, foreign_key: true
      t.references :poll_option, foreign_key: true

      t.timestamps
    end
  end
end
