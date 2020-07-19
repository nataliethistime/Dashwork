class RenameFieldsAndValues < ActiveRecord::Migration[6.0]
  def change
    rename_table :values, :custom_values
    rename_table :fields, :custom_fields
  end
end
