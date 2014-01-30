class Hub < ActiveRecord::Base
  include BlogMethods

  has_ancestry

  belongs_to :user
  has_many :categorizations
  has_many :posts, :through => :categorizations


end
