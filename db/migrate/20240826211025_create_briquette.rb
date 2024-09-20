class CreateBriquette < ActiveRecord::Migration[7.2]
  def change
    create_table :briquette do |t|
      t.belongs_to :shift, null: false, foreign_key: true, index: true
      t.time :measurement_time
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
    add_index :briquette_times, [ :shift_id, :measurement_time ], unique: true, name: 'index_briquette_on_shift_and_time'
  end
end
