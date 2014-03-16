class Admin::ManageController < ApplicationController
  authorize_resource :class => :false
  
  def index
    @hubs = Hub.all
  end
end
