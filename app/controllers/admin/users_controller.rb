class Admin::UsersController < Admin::AdminController
  load_and_authorize_resource class: Admin::UsersController
  before_action :set_user, only: [:edit, :update]

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

  def set_user
    @user = User.find params[:id] 
  end

  def user_params
    params.require(:user).permit(:email, :role_ids)
  end

end
