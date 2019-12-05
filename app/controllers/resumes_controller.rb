class ResumesController < ApplicationController

  def new
    if current_user.candidate.blank?
      redirect_to root_path, alert: 'Operation Invalid'
      return
    end

    @resume = Resume.new
    @candidate = current_user
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
