module ApplicationHelper
  include HubsHelper
  include PostsHelper

  def allow_slider
    true if %w(posts home).include?(controller_name) && action_name == 'index' && params[:tag].blank?
  end

  def owner_text_helper(options)
    start_from = options[:start_from]
    range = (start_from == Date.today.year) ? start_from : start_from...Date.today.year
    "RybakMykhailo (c) #{range}"
  end
end
