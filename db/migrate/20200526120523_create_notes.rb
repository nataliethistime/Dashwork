class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.integer :user_id, null: false
      t.integer :tenant_id, null: false
      t.integer :contact_id
      t.integer :task_id
      t.integer :equipment_id
      t.integer :project_id
      t.integer :calendar_event_id
      t.timestamps
    end
  end
end
