class Admin::ManageController < Admin::AdminController 
  load_and_authorize_resource class: Admin::ManageController
  def index
    @hubs = Hub.includes(:posts).all
  end
end
