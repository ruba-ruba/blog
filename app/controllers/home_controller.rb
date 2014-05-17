class HomeController < ApplicationController
  layout 'info', :only => [:map, :archive]

  def index
    if params[:tag]
      @posts = Post.includes(:hubs, :tags, :impressions).published.tagged_with(params[:tag]).page(params[:page]).per(6)
    else
      @posts = Post.includes(:hubs, :tags, :impressions).published.page(params[:page]).per(6)
    end
    render :stream => true
  end

  def map
    @hubs = Hub.published.includes(:posts)
  end

  def archive
    @posts =  Post.published.includes(:tags, :impressions, :hubs).group_by { |t| t.created_at.beginning_of_year }
  end

end
