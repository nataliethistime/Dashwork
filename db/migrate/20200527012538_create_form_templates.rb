class CreateFormTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :form_templates do |t|
      t.string :name
      t.integer :tenant_id, null: false
      t.timestamps
    end
  end
end
