class RemovePersonalLogEntryDate < ActiveRecord::Migration[6.0]
  def change
    remove_column :personal_log_entries, :date
  end
end
