class CandidatesController < ApplicationController

def edit
  @candidate = Candidate.find(params[:id])
end

def update
  @candidate = Candidate.find(params[:id])
  @candidate.update(candidate_params)
  redirect_to edit_candidate_path(@candidate)
end

private
def candidate_params
  params.require(:candidate).permit(:photo, :small_desc, :address, :github_link, :workauth_bra, :workauth_usa, :workauth_eu, :workauth_can, :workauth_aus, :workauth_gb)
end
end
