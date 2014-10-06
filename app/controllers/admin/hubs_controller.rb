class Admin::HubsController < Admin::AdminController

  load_and_authorize_resource class: Admin::HubsController
  inherit_resources
  actions :all, :except => [:show, :index]

  def index
    @table = Hub.meta_table(attributes:[:title, :description, :published, :parent_id, :content_type], actions: [:show, [:edit, :admin], [:destroy, :admin]])
  end

  private

  def hub_params
    params.require(:hub).permit(:title, :description, :published, :parent_id, :content_type, { :post_ids => [] })
  end
end
