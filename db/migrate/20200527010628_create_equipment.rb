class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.text :description
      t.string :model
      t.string :manufacturer

      t.timestamps
    end
  end
end
