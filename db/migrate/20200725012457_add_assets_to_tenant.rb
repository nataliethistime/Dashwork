class AddAssetsToTenant < ActiveRecord::Migration[6.0]
  def change
    change_table :assets do |t|
      t.belongs_to :tenant
    end
  end
end
