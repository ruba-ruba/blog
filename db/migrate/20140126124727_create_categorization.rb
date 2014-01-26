class CreateCategorization < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.column :hub_id, :integer
      t.column :post_id, :integer
    end
    add_index :categorizations, :hub_id
    add_index :categorizations, :post_id
  end
end