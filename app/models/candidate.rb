class Candidate < ApplicationRecord
  belongs_to :user
  has_many :resume, dependent: :destroy
  has_many :applies, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :small_desc, length: { in: 30..240 }, on: :update

  validates :github_link, format: { with: %r/(\w)?(github.com)\/(?<handler>\w+)\z/,
            message: "Must be a full GitHub link" }, on: :update

  # validates :address, presence: true, on: :update

  validates :work_auth, inclusion: { in: %w(br us can eu),
    message: "%{value} is not a valid size" }, on: :update
end
