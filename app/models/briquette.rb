class Briquette < ApplicationRecord
  belongs_to :shift

  validates :measurement_time, presence: true
  validates :briquette_speed, presence: true
  validates :status, presence: true, inclusion: { in: %w[inactive active complete] }

  private
end
