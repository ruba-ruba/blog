class Post < ActiveRecord::Base
  include BlogMethods

  belongs_to :user
  has_many :categorizations
  has_many :hubs, :through => :categorizations

  published('posts')

end
