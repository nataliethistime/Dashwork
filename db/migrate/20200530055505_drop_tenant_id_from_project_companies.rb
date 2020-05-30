class DropTenantIdFromProjectCompanies < ActiveRecord::Migration[6.0]
  def change
    remove_column :project_companies, :tenant_id
  end
end
