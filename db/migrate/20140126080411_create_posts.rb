class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.boolean :published
      t.string :content
      t.string :type

      t.timestamps
    end
  end
end
