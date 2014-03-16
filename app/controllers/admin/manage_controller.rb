class Admin::ManageController < ApplicationController
  authorize_resource :class => :false
  
  def index
    @hubs = Hub.includes(:posts).all
  end
end
