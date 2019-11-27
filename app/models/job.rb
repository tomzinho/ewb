class Job < ApplicationRecord
  belongs_to :company

  validates :company_id, presence: true
  validates :title, presence: true, length: { minimum: 10 }
  validates :description, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :location, presence: true
  # validates :latitude,
  # validates :longitude,

end
