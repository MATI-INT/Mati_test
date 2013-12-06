class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :nickname
      t.string :name
      t.text :image
      t.string :profile_url
      t.string :token
      t.string :secret

      t.timestamps
    end

    add_index :users, [:provider, :uid], unique: true
  end
end
