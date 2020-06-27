class SetupCustomFieldableType < ActiveRecord::Migration[6.0]
  def change
    add_column :values, :custom_fieldable_type, :string
    rename_column :values, :linked_record_id, :custom_fieldable_id
  end
end
