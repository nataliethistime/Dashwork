class RemoveOldGroupTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :company_company_groups
    drop_table :contact_contact_groups
  end
end
