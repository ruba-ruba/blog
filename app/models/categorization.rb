class Categorization < ActiveRecord::Base
  belongs_to :post
  belongs_to :hub
end
