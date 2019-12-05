class ResumesController < ApplicationController

  def new
    if current_user.candidate.blank?
      redirect_to root_path, alert: 'Operation Invalid'
    end

    if current_user.first_name.blank?
      redirect_to edit_candidate_path(current_user.candidate.id), alert: 'Complete your profile first'
    else
      @resume = Resume.new
      @candidate = current_user
    end
  end

  def create
    if current_user.candidate.blank?
      redirect_to root_path, alert: 'Operation Invalid'
      return
    end

    @resume = Resume.new(resume_params)
    @resume.candidate = current_user.candidate
    if @resume.save
      redirect_to candidate_dashboard_path(@resume.candidate)
    else
      render :new
    end
  end

  def show
    @resume = Resume.find(params[:id])
  end

  private

  def resume_params
    params.require(:resume).permit(:description, :education, :skills, :experience, :video, :resume_language)
  end
end
