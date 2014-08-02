class CreateBackgrounds < ActiveRecord::Migration
  def change
    create_table :backgrounds do |t|
    t.string  :target
    t.boolean :active
      t.timestamps
    end
  add_attachment :backgrounds, :image
  end
end
