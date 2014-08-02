class Admin::BackgroundsController < Admin::AdminController
  # load_and_authorize_resource class: Admin::BackgroundsController
  inherit_resources
  actions :index, :new, :create

  private
  def background_params
    params.require(:background).permit!
  end

end