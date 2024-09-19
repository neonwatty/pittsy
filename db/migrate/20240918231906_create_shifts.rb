class CreateShifts < ActiveRecord::Migration[7.2]
  def change
    create_table :shifts do |t|
      t.belongs_to :user
      t.date :date
      t.integer :shift
      t.timestamps
    end
  end
end
