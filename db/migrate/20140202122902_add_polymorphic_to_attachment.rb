class AddPolymorphicToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :attachable_id, :string
    add_column :attachments, :attachable_type, :string
  end
end
