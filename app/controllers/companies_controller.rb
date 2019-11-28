class CompaniesController < ApplicationController
  def edit
    @company = Company.find(params[:id])
  end

  def update
    raise
  end

end
