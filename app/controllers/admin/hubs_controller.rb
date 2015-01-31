class Admin::HubsController < Admin::AdminController

  load_and_authorize_resource class: Admin::HubsController
  inherit_resources
  actions :all, :except => [:show, :index]

  meta_table :hubs, [
                     :title, :description, :published, :parent_id, :content_type, 
                     {key: :actions, render_text: [:show, [:edit, :admin], [:destroy, :admin]]}
                    ],  
                    {:scope => '', per_page: 4}

  def index
    @table = render_hubs_table
  end

  private

  def hub_params
    params.require(:hub).permit(:title, :description, :published, :parent_id, :content_type, { :post_ids => [] })
  end
end
