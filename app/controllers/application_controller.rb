class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ActionView::Helpers::DateHelper
  include HubsHelper
  
  before_filter :hubs
  
  helper_method :should_render_for_post, :cp
  helper_method :post_show
  helper_method :created
  helper_method :page_title

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end

  #fix for cancan
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def page_title
    base = 'Mykhailo Rybak Blog'
    case
    when @post
      "#{@post.title} | #{base}"
    when @hub
      "#{@hub.title} | #{base}"
    else
      base
    end
  end


  def should_render_for_post
    # %w(posts hubs).include?(controller_name) && %w(index show search).include?(action_name) 
    
    #todo investigate another way to do this shit
    true
  end

  def post_show
    "#{controller_name}/#{action_name}" == 'posts/show'
  end

  def created object
    "#{time_ago_in_words(object.created_at)} ago" 
  end
  
  def cp(path)
    "current" if request.url.include?(path) || @post && @post.hubs.include?(Hub.find(path.split('/')[2]))
  end
end
