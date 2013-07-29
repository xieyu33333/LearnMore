class Admin::UsersController < Admin::BaseController
  def index
    @users = User.page params[:page]
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end
end
