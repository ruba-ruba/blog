class Admin::BackgroundsController < Admin::AdminController
  load_and_authorize_resource class: Admin::BackgroundsController
  def index
  end

  def new
  end

end