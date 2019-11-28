class JobsController < ApplicationController
  def new
    if current_user.company.blank?
      redirect_to root_path, alert: 'Operation Invalid'
      return
    end

    @job = Job.new
    @company = current_user
  end

  def create
    if current_user.company.blank?
      redirect_to root_path, alert: 'Operation Invalid'
      return
    end

    @job = Job.new(job_params)
    @job.company = current_user.company
    if @job.save
      redirect_to root
    else
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :location)
  end

end
