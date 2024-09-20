class CreateShifts < ActiveRecord::Migration[7.2]
  def change
    create_table :shifts do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.date :date
      t.integer :shift_number
      t.string :job_type
      t.string :status, default: "unassigned"
      t.string :notes, default: ""
      t.timestamps
    end
  end
end
