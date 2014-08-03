class PostsController < ApplicationController
  load_and_authorize_resource
  impressionist :actions=>[:show]
  before_action :set_post, only: [:show]
  before_action :pass_data, only: [:articles, :travels, :photos]
  
  def index
    if params[:tag]
      @posts = Post.includes(:hubs, :tags, :impressions).published.tagged_with(params[:tag]).page(params[:page]).per(6)
    else
      @posts = Post.includes(:hubs, :tags, :impressions).published.page(params[:page]).per(4)
    end
    render :stream => true
  end

  def articles
    render :index
  end

  def travels
    render :index
  end

  def pass_data
    scope = params[:action]
    @posts = Post.includes(:hubs, :tags, :impressions).send(scope.to_sym).published.page(params[:page]).per(6)
  end


  def show
  end

  def search
    @posts = Post.includes(:hubs, :tags, :impressions).published.search(params[:search]).page(params[:page]).per(6)
    render "posts/index"
  end

  def autocomplete
    posts = Post.includes(:hubs, :tags, :impressions).published.where("title LIKE ?", "%#{params[:term]}%").page(params[:page]).map(&:title)
    render :json => posts
  end

  private
    def set_post
      @post = Post.includes(:hubs, :tags, :impressions).find(params[:id])
    end
end
