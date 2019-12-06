class CandidatesController < ApplicationController
  respond_to :html, :json

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])
    @candidate.update(candidate_params)
    current_user.first_name = @candidate.first_name
    current_user.last_name = @candidate.last_name
    current_user.save
    redirect_to edit_candidate_path(@candidate)
  end

  def dashboard
    @candidate = Candidate.find(params[:id])
    @applies = @candidate.applies

  end

  def index
    @candidates = Candidate.all
  end


  private

  def candidate_params
    params.require(:candidate).permit(:photo, :photo_cache, :small_desc, :address, :github_link, :workauth_bra, :workauth_usa, :workauth_eu, :workauth_can, :workauth_aus, :workauth_gb, :work_city, :first_name, :last_name, skills_list:[])
  end
end
