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

  def self.find_for_linkedin_oauth(auth)
      user_params = auth.slice("provider", "uid")
      user_params.merge! auth.info.slice("email", "first_name", "last_name")
      user_params[:linkedin_picture_url] = auth.info.picture_url
      user_params[:token] = auth.credentials.token
      user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
      user_params = user_params.to_h

      user = User.find_by(provider: auth.provider, uid: auth.uid)
      user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
      if user
        user.update(user_params)
      else
        user = User.new(user_params)
        user.password = Devise.friendly_token[0,20]  # Fake password for validation
        user.save
      end

      return user
    end

  after_create :set_candidate_or_company

  private

  def set_candidate_or_company
    Company.create!(user: self) if role == 'company'
    Candidate.create!(user: self) if role == 'candidate'
  end

end
