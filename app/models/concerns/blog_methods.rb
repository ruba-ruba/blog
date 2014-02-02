module BlogMethods

  def self.included(receiver)
    receiver.extend ClassMethods
    receiver.send :include, InstanceMethods
  end

  module ClassMethods
    def published(table)
      scope :published, lambda { where(["#{table}.published = ?", true]) }
    end
  end
  
  module InstanceMethods
    def to_param
      "#{id}-#{title.gsub(/\s/,'-')}"
    end
  end

end