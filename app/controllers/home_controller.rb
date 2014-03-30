class HomeController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.includes(:hubs, :tags, :impressions).published.tagged_with(params[:tag]).page(params[:page])
    else
      @posts = Post.includes(:hubs, :tags, :impressions).published.page(params[:page])
    end
  end
end
