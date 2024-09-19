class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.string :first_name, null: false, default: "", limit: 255
      t.string :last_name, null: false, default: "", limit: 255
      t.string :role, default: "employee"
      t.string :status, default: "inactive"
      t.string :notes, default: ""
      t.timestamps
    end
  end
end
