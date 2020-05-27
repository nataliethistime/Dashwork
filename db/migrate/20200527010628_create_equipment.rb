class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.text :description
      t.string :model
      t.string :manufacturer

      t.integer :user_id
      t.integer :tenant_id, null: false

      t.timestamps
    end
  end
end
