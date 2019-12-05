class AppliesController < ApplicationController
  def new
    if current_user.candidate?
      if Resume.exists?(candidate_id: current_user) && !Apply.exists?(candidate_id: current_user)
        create_application
      elsif Apply.exists?(candidate_id: current_user)
        redirect_to candidate_dashboard_path(current_user.candidate.id), alert: 'You already applied'
      else
        redirect_to new_resume_path, alert: 'Create a resume first'
      end
    else
      redirect_to root_path, alert: 'Operation Invalid'
    end
  end

  def index
    @job = Job.find(params[:job_id])
    @applies = Apply.where(job_id: @job)
  end

  private

  def create_application
    application = Apply.new
    application.candidate_id = current_user.candidate.id
    job = Job.find(params[:job_id])
    application.job_id = job.id
    application.save
    redirect_to candidate_dashboard_path(current_user.candidate.id), alert: 'Now the ball is in the company court'
  end

  def job_params
    params.require(:job).permit(:job_id)
  end

end
