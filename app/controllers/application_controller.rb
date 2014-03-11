class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ActionView::Helpers::DateHelper
  include HubsHelper
  
  before_filter :hubs
  
  helper_method :render_menu_partial
  helper_method :post_show
  helper_method :created

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_url
  end

  # fix for cancan
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def render_menu_partial
    %w(posts hubs).include?(controller_name) && %w(index show).include?(action_name) 
  end

  def post_show
    "#{controller_name}/#{action_name}" == 'posts/show'
  end

  def created object
    "#{time_ago_in_words(object.created_at)} ago" 
  end
  
end
