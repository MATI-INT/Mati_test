class AddImageUidToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :image_uid, :string
  end
end
