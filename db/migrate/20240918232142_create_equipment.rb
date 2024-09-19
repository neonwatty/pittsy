class CreateEquipment < ActiveRecord::Migration[7.2]
  def change
    create_table :equipment do |t|
      t.string :name, null: false
      t.string :category
      t.integer :quantity, default: 0
      t.text :description
      t.timestamps
    end
  end
end
