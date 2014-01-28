class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates :name, :uniqueness => true
  belongs_to :resource, :polymorphic => true  
  scopify
end
