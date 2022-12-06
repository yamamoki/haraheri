class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
