module ApplicationHelper
  include HubsHelper
  include PostsHelper

  def allow_slider
    true if %w(posts home).include?(controller_name) && action_name == 'index' && params[:tag].blank?
  end
end
