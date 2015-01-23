class HomeController < ApplicationController
  layout 'info', :only => [:map, :archive]

  respond_to :json

  def index
    @posts = Post.published.includes(:hubs, :attachments)
    if params[:tag]
      @posts = @posts.tagged_with(params[:tag]).page(params[:page]).per(6)
    end
    @posts = @posts.page(params[:page]).per(6)
  end

  def map
    @hubs = Hub.published.includes(:posts)
  end

  def archive
    @posts = Post.includes(:hubs, :attachments).published.group_by { |t| t.created_at.beginning_of_year }
  end

end
