class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.string :user_name
      t.string :email

      t.timestamps
    end
  end
end
