  class CompaniesController < ApplicationController
  def edit
    @company = Company.find(params[:id])
  end

  def show
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to edit_company_path(@company)
  end

  def dashboard
    @company = Company.find(params[:id])
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:website, :facebook_link, :twitter_link, :logo, :banner, :cnpj, :address, :source)
  end
end
