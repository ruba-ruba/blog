class Post < ActiveRecord::Base
  include BlogMethods

  belongs_to :user
  has_many :categorizations
  has_many :hubs, :through => :categorizations

  published('posts')

  def self.search(search)
    if search
      where('title LIKE :search OR content LIKE :search',  {:search => "%#{search}%"})
    else
      scoped
    end
  end

end
