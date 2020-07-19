class RenameFieldIdColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :custom_values, :field_id, :custom_field_id
  end
end
