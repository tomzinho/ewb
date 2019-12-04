class CandidatesController < ApplicationController
  respond_to :html, :json

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])
    @candidate.update(candidate_params)
    redirect_to edit_candidate_path(@candidate)
  end

  def dashboard
    @candidate = Candidate.find(params[:id])
  end

  def index
    @candidates = Candidate.all
  end


  private

  def candidate_params
    params.require(:candidate).permit(:photo, :photo_cache, :small_desc, :address, :github_link, :workauth_bra, :workauth_usa, :workauth_eu, :workauth_can, :workauth_aus, :workauth_gb, :work_city, skills_list:[])
  end
end
