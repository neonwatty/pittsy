class CreateDryerAssignments < ActiveRecord::Migration[7.2]
  def change
    create_table :dryer_job_assignments do |t|
      t.belongs_to :shift
      t.string :blend
      t.integer :num_bays_full_blast
      t.decimal :bentonite_inventory_end_of_shift
      t.decimal :cement_inventory_end_of_shift
      t.decimal :molasses_inventory_tank_one_end_of_shift
      t.decimal :molasses_inventory_tank_two_end_of_shift
      t.timestamps
    end
  end
end
