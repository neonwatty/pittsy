class CreateInspectSkidsteers < ActiveRecord::Migration[6.0]
  def change
    create_table :inspect_skidsteers do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.string :inspector_name
      t.integer :shift
      t.integer :machine_hours
      t.integer :structural_damage
      t.string :structural_damage_comments
      t.integer :tires_tracks
      t.string :tire_tracks_comments
      t.integer :glass_mirrors
      t.string :glass_mirrors_comments
      t.integer :electrical_connections
      t.string :electrical_connections_comments
      t.integer :hydraulic_hoses
      t.string :hydraulic_hoses_comments
      t.integer :lubrication
      t.string :lubrication_comments
      t.integer :fluid_levels
      t.string :fluid_levels_comments
      t.integer :engine_oil
      t.string :engine_oil_comments
      t.integer :coolant
      t.string :coolant_comments
      t.integer :fire_extinguisher
      t.string :fire_extinguisher_comments
      t.integer :seat_belts
      t.string :seat_belts_comments
      t.integer :operating_controls
      t.string :operating_controls_comments
      t.integer :horn_gauges
      t.string :horn_gauges_comments
      t.integer :lights_reflectors
      t.string :lights_reflectors_comments
      t.integer :windsheild_wipers
      t.string :windsheild_wipers_comments
      t.integer :ac_heat
      t.string :ac_heat_comments
      t.integer :steering_system
      t.string :steering_system_comments
      t.integer :brakes
      t.string :brakes_comments
      t.integer :backup_alarm
      t.string :backup_alarm_comments

      t.timestamps
    end
  end
end
