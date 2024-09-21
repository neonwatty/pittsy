class Briquette < ApplicationRecord
  belongs_to :shift

  validates :status, presence: true, inclusion: { in: %w[inactive active complete] }
  before_save :set_status

  private

  def set_status
    # Check if attributes are completed; then status is complete
    attributes_to_check = %i[
      measurement_time
      material_rate_bin_a
      cyclone_photo
      control_setpoint
      control_temp
      gas_valve_position
      background_temp
      baghouse_temp
      baghouse_fan_amp
      material_moisture
      air_compression
    ]

    if attributes_to_check.any? { |attr| send(attr).blank? }
      # If any attribute is blank, check the time since creation
      if updated_at - created_at > 5.seconds
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
