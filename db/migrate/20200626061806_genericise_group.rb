class GenericiseGroup < ActiveRecord::Migration[6.0]
  def change
    rename_table :company_groups, :groups
    add_column :groups, :type, :string
  end
end
