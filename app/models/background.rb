class Background < ActiveRecord::Base
  BECKGROUND_TYPES = %w(HeaderBackground)

  has_attached_file :image, 
                    :styles => lambda{ |image| Background.image_size(image) },
                    :default_url => "/images/missing_:style.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.image_size(image)
    case image.instance.target
    when 'HeaderBackground'
      { :header => "920x250#" }
    end 
  end
end
