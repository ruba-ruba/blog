module HubsHelper
  def hubs
    @hubs_tree = Hub.roots
  end
end
