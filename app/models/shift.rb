class Shift < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :shift_number, presence: true, inclusion: { in: 1..3 }
  validates :job_type, presence: true, inclusion: { in: %w[briqu dryer] }
  validates :status, presence: true, inclusion: { in: %w[unassigned scheduled working complete failed] }
end
