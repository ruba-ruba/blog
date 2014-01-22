class HubsController < ApplicationController
  before_action :set_hub, only: [:show, :edit, :update, :destroy]

  # GET /hubs
  # GET /hubs.json
  def index
    @hubs = Hub.all
  end

  # GET /hubs/1
  # GET /hubs/1.json
  def show
  end

  # GET /hubs/new
  def new
    @hub = Hub.new
  end

  # GET /hubs/1/edit
  def edit
  end

  # POST /hubs
  # POST /hubs.json
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

  # PATCH/PUT /hubs/1
  # PATCH/PUT /hubs/1.json
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

  # DELETE /hubs/1
  # DELETE /hubs/1.json
  def destroy
    @hub.destroy
    respond_to do |format|
      format.html { redirect_to hubs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hub
      @hub = Hub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hub_params
      params.require(:hub).permit(:title, :description, :published, :parent_id, :ancestry)
    end
end
