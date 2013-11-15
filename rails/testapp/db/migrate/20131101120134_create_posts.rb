class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :body

      t.timestamps
      # updated_at
      # created_at
      # id - key, unique, autoincrement

    end
  end
end