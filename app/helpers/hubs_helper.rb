module HubsHelper
  def hubs
    @hubs_tree = Hub.published.roots
  end
end
