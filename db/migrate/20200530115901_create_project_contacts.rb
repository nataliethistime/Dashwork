class CreateProjectContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :project_contacts do |t|
      t.belongs_to :project
      t.belongs_to :contact
      t.timestamps
    end
  end
end
