class Shift < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :shift, presence: true, inclusion: { in: 1..3 }
  validates :job_type, presence: true, inclusion: { in: %w[briqu dryer] }
end
