module BlogMethods

  def self.included(receiver)
    receiver.extend ClassMethods
    receiver.send :include, InstanceMethods
  end

  module ClassMethods
    # def find(param)
    #   param.to_i == 0 ? find_by_title(param.gsub("-", " ")) : super
    # end 
  end
  
  module InstanceMethods
    def to_param
      "#{id}-#{title.gsub(/\s/,'-')}"
    end
  end

end
