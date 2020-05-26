class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.string :name

      t.boolean :notes_app
      t.boolean :contacts_app
      t.boolean :forms_app
      t.boolean :tasks_app
      t.boolean :equipment_app
      t.boolean :projects_app
      t.boolean :calendar_app
      t.boolean :timesheets_app

      t.timestamps
    end
  end
end
