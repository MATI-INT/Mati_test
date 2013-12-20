class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :review_id
      t.integer :user_id

      t.timestamps
    end

    add_index :votes, :review_id
    add_index :votes, :user_id
    add_index :votes, [:review_id, :user_id], unique: true
  end
end
