class Post < ActiveRecord::Base
  include BlogMethods
  paginates_per 6
  is_impressionable
  
  POST_TYPES = %w(Article Travel Photo) # code ? 

  belongs_to :user
  has_many :categorizations
  has_many :hubs, :through => :categorizations
  has_many :attachments, :as => :attachable

  published('posts')
  scope :articles,  -> { where(type: 'Article') }

  def self.search(search)
    if search
      where('title LIKE :search OR content LIKE :search',  {:search => "%#{search}%"})
    else
      scoped
    end
  end

end
