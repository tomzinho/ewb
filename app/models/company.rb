class Company < ApplicationRecord
  belongs_to :user

  # validates :website
  # validates :facebook_link
  # validates :twitter_link
  # validates :logo
  # validates :banner
  validates :cnpj, numericality: { only_integer: true }
  validates :address, presence: true
  # validates :latitude
  # validates :longitude
  validates :term_of_use, acceptance: { message: 'must be abided' }
  # validates :source

end
