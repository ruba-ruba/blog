class PostsController < ApplicationController
  impressionist actions: [:show]
  before_action :pass_data, only: [:articles, :travels, :photos]

  def index
    @posts = Post.includes(:hubs, :attachments).published
    @posts =
      if params[:tag]
        @posts.tagged_with(params[:tag]).page(params[:page]).per(6)
      else
        @posts.page(params[:page]).per(6)
      end
    render json: @posts
    # render stream: true
  end

  def articles
    render :index
  end

  def travels
    render :index
  end

  def pass_data
    scope = params[:action]
    @posts = Post.includes(:hubs, :attachments).published.send(scope.to_sym).page(params[:page]).per(6)
  end

  def show
    @post = Post.includes(:hubs).find(params[:id])
    if @post.draft? && !(current_user && current_user.admin?)
      raise ActiveRecord::RecordNotFound
    end
  end

  def search
    @posts = Post.published.includes(:hubs).search(params[:search]).page(params[:page]).per(6)
    render "posts/index"
  end

  def autocomplete
    posts = Post.published.search(params[:term]).page(params[:page]).map{|p| p.title[0..18]}
    render :json => posts
  end

  private
  def accessiable_posts
  end

end
