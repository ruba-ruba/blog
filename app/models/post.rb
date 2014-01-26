class Post < ActiveRecord::Base
  include BlogMethods

  belongs_to :user
end
