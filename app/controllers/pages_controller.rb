class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]


  def home
    @jobs = Job.last(4)
  end

  def role
    @user = current_user
  end

  def role_update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end

end
