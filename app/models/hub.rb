class Hub < ActiveRecord::Base
  include BlogMethods

  has_ancestry

  belongs_to :user


end
