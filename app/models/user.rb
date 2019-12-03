class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:linkedin]
  has_one :company
  has_one :condidate

  enum role: %i[candidate company]

  has_one :candidate
  has_one :company

  after_create :set_candidate_or_company

  private

  def set_candidate_or_company
    Company.create!(user: self) if role == 'company'
    Candidate.create!(user: self) if role == 'candidate'
  end

end
