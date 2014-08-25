class PostsController < ApplicationController
  impressionist actions: [:show]
  before_action :pass_data, only: [:articles, :travels, :photos]
  
  def index
    if params[:tag]
      @posts = Post.includes(:hubs, :tags).published.tagged_with(params[:tag]).page(params[:page]).per(6)
    else
      @posts = Post.includes(:hubs, :tags).published.page(params[:page]).per(6)
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
    @posts = Post.includes(:hubs, :tags).send(scope.to_sym).published.page(params[:page]).per(6)
  end


  def show
    @post = Post.includes(:hubs, :tags).find(params[:id])
    if @post.draft? && !current_user && !(current_user && current_user.admin?)
      raise ActiveRecord::RecordNotFound
    end
  end

  def search
    @posts = Post.published.includes(:hubs, :tags).search(params[:search]).page(params[:page])
    render "posts/index"
  end

  def autocomplete
    posts = Post.published.where("title LIKE ?", "%#{params[:term]}%").page(params[:page]).map{|p| p.title[0..18]}
    render :json => posts
  end

end
