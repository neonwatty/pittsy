class Briquette < ApplicationRecord
  belongs_to :shift

  validates :status, presence: true, inclusion: { in: %w[inactive active complete] }

  private
end
