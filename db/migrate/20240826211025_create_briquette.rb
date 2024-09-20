class CreateBriquette < ActiveRecord::Migration[7.2]
  def change
    create_table :briquettes do |t|
      t.belongs_to :shift, null: false, foreign_key: true, index: true
      t.time :measurement_time, null: true, default: nil
      t.integer :briquette_speed, null: true, default: nil
      t.boolean :bop_or_blast, null: true, default: nil
      t.decimal :dry_material, null: true, default: nil
      t.decimal :wet_bentonite, null: true, default: nil
      t.string :pug_mill_one_amp, null: true, default: nil
      t.integer :water, null: true, default: nil
      t.string :tons_per_hour, null: true, default: nil
      t.string :briquette_moisture, null: true, default: nil
      t.string :pug_mill_two_amp, null: true, default: nil
      t.string :bulk_density, null: true, default: nil
      t.string :lime, null: true, default: nil
      t.string :molasses, null: true, default: nil
      t.string :status, default: "incomplete"
      t.string :notes, default: ""
      t.timestamps
    end
  end
end
