class Hub < ActiveRecord::Base
  has_ancestry

  belongs_to :user


  def self.find(param)
    param.to_i == 0 ? find_by_title(param.gsub("-", " ")) : super
  end

  def to_param
    title.gsub(/\s/,'-')
  end

end
