class Job < ApplicationRecord
  belongs_to :company
  has_many :applies

  validates :company_id, presence: true, on: :update
  validates :title, presence: true, length: { minimum: 10 }, on: :update
  validates :description, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }, on: :update
  validates :location, presence: true, on: :update
  # validates :latitude, on: :update
  # validates :longitude, on: :update

end
