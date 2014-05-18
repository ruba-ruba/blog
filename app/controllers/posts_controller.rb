class PostsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :except => [:new, :edit, :create, :update, :destroy]
  impressionist :actions=>[:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :pass_data, only: [:articles, :travels, :photos]
  layout 'admin', :only => [:edit, :new]
  
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

  def new
    @post = Post.new
    @post.attachments.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit!
      #params.require(:post).permit(:user_id, :title, :published, :content, :content_type, :tag_list, :type, {:hub_ids => []}, attachments: Attachment.attribute_names.collect { |att| att.to_sym })
    end

end
