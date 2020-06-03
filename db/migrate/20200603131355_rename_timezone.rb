class RenameTimezone < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :timezone, :time_zone
  end
end
