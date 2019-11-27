class Company < ApplicationRecord
  belongs_to :user
  has_many :jobs

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  # validates :website, on: :update
  # validates :facebook_link, on: :update
  # validates :twitter_link, on: :update
  # validates :logo, on: :update
  # validates :banner, on: :update
  validates :cnpj, numericality: { only_integer: true }, on: :update
  # validates :address, presence: true, on: :update
  # validates :latitude, on: :update
  # validates :longitude, on: :update
  # validates :term_of_use, acceptance: { message: 'must be abided' }, on: :update
  # validates :source, on: :update
end
