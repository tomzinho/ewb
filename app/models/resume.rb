class Resume < ApplicationRecord
  belongs_to :candidate

  validates :candidate_id, presence: true
  validates :resume_language, inclusion: { in: ["english","spanish","portuguese", "french", "german", "japanese", "chinese"], allow_nil: false }
  validates :description, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :education, presence: true
  validates :skills, length: { minimum: 2 }, presence: true
  validates :experience, presence: true
end
