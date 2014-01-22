class AddAncestryToHubs < ActiveRecord::Migration
  def change
    add_column :hubs, :ancestry, :string
  end
end
