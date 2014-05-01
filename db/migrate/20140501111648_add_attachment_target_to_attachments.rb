class AddAttachmentTargetToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :target, :string
  end
end
