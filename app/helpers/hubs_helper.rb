module HubsHelper
  def category_menu
    @categories = Hub.published.roots
  end
end
