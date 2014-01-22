class CreateHubs < ActiveRecord::Migration
  def change
    create_table :hubs do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.boolean :published

      t.timestamps
    end
  end
end
