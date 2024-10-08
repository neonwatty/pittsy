class Shift < ApplicationRecord
  belongs_to :user
  has_many :briquettes, dependent: :destroy
  has_many :dryers, dependent: :destroy
  after_create :create_jobs

  validates :date, presence: true
  validates :shift_number, presence: true, inclusion: { in: 1..3 }
  validates :job_type, presence: true, inclusion: { in: %w[briqu dryer] }
  validates :status, presence: true, inclusion: { in: %w[unassigned scheduled working complete failed] }

  def create_jobs
    return unless job_type == "briqu" or job_type == "dryer"

    if job_type == "briqu"
      8.times { briquettes.create! }
    elsif job_type == "dryer"
      8.times { dryers.create! }
    end
  end
end
