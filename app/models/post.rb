require 'elasticsearch/model'

class Post < ActiveRecord::Base
  include Elasticsearch::Model
  # include Elasticsearch::Model::Callbackss
  include BlogMethods

  is_impressionable counter_cache: true, column_name: :views_count
  acts_as_taggable_on :skills

  POST_TYPES       = %w(Article Travel Photo Code)
  ATTACHMENT_TYPES = %w(Logo)

  belongs_to :user
  has_many :categorizations
  has_many :hubs, :through => :categorizations
  has_many :attachments, :as => :attachable
  accepts_nested_attributes_for :attachments
 
  published('posts')
  scope :desc,       -> { order("posts.created_at DESC") }
  scope :articles,   -> { where(content_type: 'Article') }
  scope :travels,    -> { where(content_type: 'Travel')  }
  scope :photos,     -> { where(content_type: 'Photo')   }
  scope :last_month, -> { where('created_at >= ?', 1.month.ago)}
  scope :last_year,  -> { where('created_at >= ?', 1.year.ago) }


  validates :title, presence: true
  validates :published, :inclusion => {:in => [true, false]}
  validates :hubs, :presence => true
  validates :content, :presence => true


  def self.search(search)
    if search
      where('title LIKE :search OR content LIKE :search',  {:search => "%#{search}%"})
    else
      self.published.limit(8)
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

  def draft?
    !published
  end

end
