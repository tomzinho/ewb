class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :how]


  def home
    @jobs = Job.last(4)
  end

  def role
    @user = current_user
  end

  def role_update
    @user = User.find(params[:id])

    if @user.role == 'company'
      @user.company = Company.new(user_id: current_user)
    else
      @user.candidate = Candidate.new(user_id: current_user)
    end

    @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end

end
