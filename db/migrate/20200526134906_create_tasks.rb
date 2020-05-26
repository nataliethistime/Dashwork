class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :due_date
      t.boolean :completed
      t.integer :user_id
      t.integer :tenant_id
      t.integer :contact_id
      t.integer :equipment_id
      t.integer :project_id
      t.integer :calendar_event_id
      t.integer :note_id

      t.timestamps
    end
  end
end
