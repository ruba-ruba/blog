class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ActionView::Helpers::DateHelper
  include ApplicationHelper
  
  before_filter :category_menu, :recent_posts, :best_ever, :best_by_month, :best_by_year
  
  helper_method :current_hub, :current_tab
  helper_method :wants_menu, :wants_header, :best_posts
  helper_method :allow_slider
  helper_method :post_show
  helper_method :created
  helper_method :page_title

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end

  # fix for cancan, without this shit cancan doesn't work 
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def page_title
    base = 'Mykhailo Rybak Blog'
    case
    when @post && @post.title.present?
      "#{@post.title} | #{base}"
    when @hub && @hub.title.present?
      "#{@hub.title} | #{base}"
    else
      base
    end
  end


  def wants_header
    # %w(posts hubs).include?(controller_name) && %w(index show search).include?(action_name) 
    #todo investigate another way to do this shit
    true
  end

  def wants_menu
    true
  end

  def best_posts
    true
  end

  def post_show
    "#{controller_name}/#{action_name}" == 'posts/show'
  end

  def created object
    "#{time_ago_in_words(object.created_at)} ago" 
  end
  
  def current_hub(path)
    "current_hub" if request.url.include?(path) || @post && @post.hubs.include?(Hub.find(path.split('/')[2]))
  end

  def current_tab(path)
    "current_tab" if request.url == path
  end
end
