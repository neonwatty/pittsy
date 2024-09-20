class Shift < ApplicationRecord
  belongs_to :user
  has_many :briquettes
  # after_commit :create_jobs

  validates :date, presence: true
  validates :shift_number, presence: true, inclusion: { in: 1..3 }
  validates :job_type, presence: true, inclusion: { in: %w[briqu dryer] }
  validates :status, presence: true, inclusion: { in: %w[unassigned scheduled working complete failed] }

  # def create_jobs
  #   if Briquette.(shift_id).job_type == "briqu"
  #     8.times do
  #     Briquette.create(shift_id: @shift)
  #     end
  #   elsif Briquette.(shift_id).job_type == "bop"
  #     8.times do
  #     Briquette.create(shift_id: @shift)
  #     end
  #   end
  # end
end
