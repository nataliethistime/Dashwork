class CreateFormTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :form_templates do |t|
      t.string :name

      t.timestamps
    end
  end
end
