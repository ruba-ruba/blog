class Attachment < ActiveRecord::Base

  belongs_to :attachable, :polymorphic => true

  IMAGE_TYPES = ["image/jpg", "image/jpeg", "image/png"]

  has_attached_file :file, 
                    :styles => lambda{ |a| IMAGE_TYPES.include?(a.content_type) ? { :logo => "440x240#" } : {}  },
                    :default_url => "/images/missing_:style.png"

  do_not_validate_attachment_file_type :file

  before_create :remove_previouse_attached
  def remove_previouse_attached
    Attachment.where(
    				  attachable_id: self.attachable_id,
    				  attachable_type: self.attachable_type,
    				  target: self.target
    				).destroy_all if self.file.present?

  end
end
