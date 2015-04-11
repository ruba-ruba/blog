class HomeController < ApplicationController
  layout 'info', :only => [:map, :archive]

  def index
    @posts = Post.published.includes(:hubs)
    if params[:tag]
      @posts = @posts.tagged_with(params[:tag])
    end
    @posts = @posts.page(params[:page]).per(6)
  end

  def map
    @hubs = Hub.published.includes(:posts)
  end

  def archive
    @posts = Post.published.includes(:hubs).group_by { |t| t.created_at.beginning_of_year }
  end

end
