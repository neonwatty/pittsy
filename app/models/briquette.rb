class Briquette < ApplicationRecord
  belongs_to :shift

  validates :measurement_time, presence: true
  validates :briquette_speed, presence: true

  validate :limit_measurements_per_shift

  private

  def limit_measurements_per_shift
    if shift.briquette_times.count >= 8
      errors.add(:base, "Cannot have more than 8 measurements for this shift.")
    end
  end
end
