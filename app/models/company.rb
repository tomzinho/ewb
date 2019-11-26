class Company < ApplicationRecord
  belongs_to :user
  has_many :jobs

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

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
