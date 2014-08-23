class HubsController < ApplicationController
  before_action :set_hub, only: :show
 
  def index
    @hubs = Hub.published.includes(:posts).published
  end

  def show
  end

  def new
    @hub = Hub.new
  end

  def edit
  end

  def create
    @hub = current_user.hubs.build(hub_params)

    respond_to do |format|
      if @hub.save
        format.html { redirect_to @hub, notice: 'Hub was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hub }
      else
        format.html { render action: 'new' }
        format.json { render json: @hub.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hub.update(hub_params)
        format.html { redirect_to @hub, notice: 'Hub was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hub.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hub.destroy
    respond_to do |format|
      format.html { redirect_to hubs_url }
      format.json { head :no_content }
    end
  end

  private
  def set_hub
    @hub = Hub.published.includes(:posts).find(params[:id])
    @posts = @hub.posts.published.page(params[:page]).per(6)
  end
end
