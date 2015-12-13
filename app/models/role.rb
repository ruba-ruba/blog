class Role < ActiveRecord::Base
  # scopify
  has_and_belongs_to_many :users
  belongs_to :resource, :polymorphic => true  
  validates :name, :uniqueness => true
end
