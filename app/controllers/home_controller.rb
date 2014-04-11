class HomeController < ApplicationController
  #authorize_resource :class => :false
  
  def index
    if params[:tag]
      @posts = Post.includes(:hubs, :tags, :impressions).published.tagged_with(params[:tag]).page(params[:page]).per(6)
    else
      @posts = Post.includes(:hubs, :tags, :impressions).published.page(params[:page]).per(4)
    end
  end

  def site_map
    @hubs = Hub.includes(:posts)
  end
end
