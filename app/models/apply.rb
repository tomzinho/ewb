class Apply < ApplicationRecord
  belongs_to :candidate
  belongs_to :job

  validates :candidate_id, uniqueness: true
end
