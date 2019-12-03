class Resume < ApplicationRecord
  belongs_to :candidate

  LANGUAGE_LIST = ["English", "Spanish", "Portuguese", "French", "German", "Japanese", "Chinese"]

  mount_uploader :video, PhotoUploader

  validates :candidate_id, presence: true
  validates :resume_language, inclusion: { in: LANGUAGE_LIST, allow_nil: false }
  # validates :description, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  # validates :education, presence: true
  # validates :skills, length: { minimum: 2 }, presence: true
  # validates :experience, presence: true
end
