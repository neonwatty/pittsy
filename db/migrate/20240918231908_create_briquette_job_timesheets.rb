class CreateBriquetteJobTimesheets < ActiveRecord::Migration[7.2]
  def change
    create_table :briquette_job_timesheets do |t|
      t.belongs_to :briquette_job_assignment
      t.time :start_time
      t.integer :briquette_speed
      t.boolean :bop_or_blast
      t.decimal :dry_material
      t.decimal :wet_bentonite
      t.string :pug_mill_one_amp
      t.integer :water
      t.string :tons_per_hour
      t.string :briquette_moisture
      t.string :pug_mill_two_amp
      t.string :bulk_density
      t.string :lime
      t.string :molasses
      t.timestamps
    end
  end
end
