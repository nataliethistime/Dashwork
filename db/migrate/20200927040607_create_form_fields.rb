class CreateFormFields < ActiveRecord::Migration[6.0]
  def change
    create_table :form_fields do |t|
      t.belongs_to :form_template
      t.string :label, null: false
      t.string :type, null: false
      t.timestamps
    end
  end
end
