class Post < ActiveRecord::Base
  include BlogMethods
  is_impressionable
  acts_as_ordered_taggable

  POST_TYPES       = %w(Article Travel Photo Code)
  ATTACHMENT_TYPES = %w(Logo)

  belongs_to :user
  has_many :categorizations
  has_many :hubs, :through => :categorizations
  has_many :attachments, :as => :attachable
  accepts_nested_attributes_for :attachments

  published('posts')
  default_scope { order('created_at desc') }
  scope :desc, -> {order("posts.created_at DESC")} 
  scope :articles,  -> { where(content_type: 'Article') }
  scope :travels,  -> { where(content_type: 'Travel') }
  scope :photos,  -> { where(content_type: 'Photo') }
  scope :last_month, ->{ where('created_at >= ?', 1.month.ago)}
  scope :last_year, ->{ where('created_at >= ?', 1.year.ago)}


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

  def previous
    Post.where(:content_type => self.content_type).where("id < ?", id).first
  end
  
  def next
    Post.where(:content_type => self.content_type).where("id > ?", id).first
  end

  def logo
    attachments.where(target: 'Logo').first.file.url(:logo) if self.attachments.any?
  end

end
