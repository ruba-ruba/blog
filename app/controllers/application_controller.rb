class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ActionView::Helpers::DateHelper
  include ApplicationHelper

  before_filter :category_menu, :recent_posts, :best_ever, :best_by_month, :best_by_year
  before_filter :set_locale

  helper_method :current_hub, :current_tab
  helper_method :show_header?, :show_categories?, :show_best_posts?
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
    if @post && @post.title.present?
      "#{@post.title} | #{base_title}"
    elsif @hub && @hub.title.present?
      "#{@hub.title}  | #{base_title}"
    else
      base_title
    end
  end

  def base_title
    I18n.t('.base_title')
  end

  # def default_url_options(options={})
  #   { :locale => I18n.locale == I18n.default_locale ? nil : I18n.locale  }
  # end


  def show_header?
    # %w(posts hubs).include?(controller_name) && %w(index show search).include?(action_name) 
    #todo investigate another way to do this shit
    true
  end

  def show_categories?
    false
  end

  def show_best_posts?
    false
  end

  def post_show
    "#{controller_name}/#{action_name}" == 'posts/show'
  end

  def created object
    "#{time_ago_in_words(object.created_at)} #{I18n.t('.ago')}"
  end

  def current_hub(path)
    "current_hub" if request.url.include?(path) || @post && @post.hubs.include?(Hub.find(path.split('/')[2]))
  end

  def current_tab(path)
    "current_tab" if request.url == path
  end

  def local_request?
    false
  end

  private

  def set_locale
    if %w(en ua).include?(params[:locale])
      cookies[:locale] = params[:locale]
    end
    I18n.locale = params[:locale] || cookies[:locale] || I18n.default_locale
  end
end
