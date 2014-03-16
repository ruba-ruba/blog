class InfoController < ApplicationController
  authorize_resource :class => :false

  def site_map
    @hubs = Hub.all
  end

end
