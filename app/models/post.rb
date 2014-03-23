class Post < ActiveRecord::Base
  include BlogMethods
  paginates_per 6
  is_impressionable
  acts_as_ordered_taggable

  POST_TYPES = %w(Article Travel Photo) # code ? 

  belongs_to :user
  has_many :categorizations
  has_many :hubs, :through => :categorizations
  has_many :attachments, :as => :attachable
  accepts_nested_attributes_for :attachments

  published('posts')
  default_scope { order('created_at desc') } 
  scope :articles,  -> { where(content_type: 'Article') }
  scope :travels,  -> { where(content_type: 'Travel') }
  scope :photos,  -> { where(content_type: 'Photo') }

  validates :title, presence: true
  validates :published, :inclusion => {:in => [true, false]}
  validates :hubs, :presence => true
  validates :content, :presence => true


  def self.search(search)
    if search
      where('title LIKE :search OR content LIKE :search',  {:search => "%#{search}%"})
    else
      scoped
    end
  end

end
