class AddAssetsAppToTenant < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :assets_app, :boolean, default: false
  end
end
