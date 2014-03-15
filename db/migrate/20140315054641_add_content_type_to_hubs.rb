class AddContentTypeToHubs < ActiveRecord::Migration
  def change
    add_column :hubs, :content_type, :string
  end
end
