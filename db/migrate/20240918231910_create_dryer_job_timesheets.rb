class CreateDryerJobTimesheets < ActiveRecord::Migration[7.2]
  def change
    create_table :dryer_job_timesheets do |t|
      t.belongs_to :dryer_job_assignment
      t.time :start_time
      t.decimal :material_rate_bin_a
      t.decimal :cyclone_photo
      t.decimal :control_setpoint
      t.decimal :control_temp
      t.integer :gas_valve_position
      t.integer :background_temp
      t.decimal :baghouse_temp
      t.decimal :baghouse_fan_amp
      t.decimal :material_moisture
      t.decimal :air_compression
      t.timestamps
    end
  end
end
