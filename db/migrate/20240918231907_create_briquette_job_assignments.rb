class CreateBriquetteJobAssignments < ActiveRecord::Migration[7.2]
  def change
    create_table :briquette_job_assignments do |t|
      t.belongs_to :shift
      t.belongs_to :user
      t.date :date
      t.integer :scheduled_hours_blast
      t.integer :scheduled_hours_bop
      t.integer :total_scheduled_hours
      t.timestamps
    end
  end
end
