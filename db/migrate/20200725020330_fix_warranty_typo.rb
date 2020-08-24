class FixWarrantyTypo < ActiveRecord::Migration[6.0]
  def change
    rename_column :assets, :waranty_date, :warranty_date
  end
end
