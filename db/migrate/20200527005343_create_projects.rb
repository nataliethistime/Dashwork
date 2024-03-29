class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :user_id, null: false
      t.integer :tenant_id, null: false
      t.timestamps
    end
  end
end
