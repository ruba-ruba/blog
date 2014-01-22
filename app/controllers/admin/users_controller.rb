class Admin::UsersController < ApplicationController

  before_action :set_hub, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to hubs_path
    else
      redirect_to root_path
    end
  end

  private

  def set_hub
    @user = User.find params[:id] 
  end

  def user_params
    params.require(:user).permit(:email)
  end

end
