class Candidate < ApplicationRecord
  belongs_to :user
  has_many :resume, dependent: :destroy
  has_many :applies, dependent: :destroy

  validates :small_desc,length: { in: 30..240 }
  validates :github_link, format: { with: %r/(\w)?(github.com)\/(?<handler>\w+)\z/,
            message: "Must be a full GitHub link" }
  validates :address, presence: true
  validates :work_auth, inclusion: { in: %w(br us can eu),
    message: "%{value} is not a valid size" }
end
