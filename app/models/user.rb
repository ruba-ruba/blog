class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hubs
  has_many :posts
  has_and_belongs_to_many :roles

  after_create :default_role

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end


  private
  
  def default_role
    self.roles << Role.where(:name => 'user').first
  end

end
