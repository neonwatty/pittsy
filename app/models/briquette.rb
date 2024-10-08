class Briquette < ApplicationRecord
  belongs_to :shift

  validates :status, presence: true, inclusion: { in: %w[inactive active complete] }
  before_save :set_status

  private

  def set_status
    # Check if attributes are completed; then status is complete
    attributes_to_check = %i[
      measurement_time
      briquette_speed
      bop_or_blast
      dry_material
      wet_bentonite
      pug_mill_one_amp
      water
      tons_per_hour
      briquette_moisture
      pug_mill_two_amp
      bulk_density
      lime
      molasses
    ]

    if attributes_to_check.any? { |attr| send(attr).blank? }
      # count the number of attributes that are not blank
      present_count = attributes_to_check.count { |attr| send(attr).present? }
      if present_count > 0
        self.status = "active"
      else
        self.status = "inactive"
      end
    else
      # If all attributes are present
      self.status = "complete"
    end
  end
end
