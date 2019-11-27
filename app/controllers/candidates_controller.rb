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
  params.require(:candidate).permit(:small_desc, :address, :github_link)
  end

end
