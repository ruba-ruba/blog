module HubsHelper
  def hubs
    @hubs_for_tree = Hub.roots
  end
end
