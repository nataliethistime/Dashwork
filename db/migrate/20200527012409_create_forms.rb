class CreateForms < ActiveRecord::Migration[6.0]
  def change
    create_table :forms do |t|
      t.string :name
      t.integer :status

      t.integer :user_id, null: false
      t.integer :tenant_id, null: false
      t.integer :form_template_id, null: false
      t.integer :contact_id
      t.integer :equipment_id
      t.integer :project_id
      t.integer :calendar_event_id

      t.timestamps
    end
  end
end
