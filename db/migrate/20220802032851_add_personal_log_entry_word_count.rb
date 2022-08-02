class AddPersonalLogEntryWordCount < ActiveRecord::Migration[6.0]
  def change
    change_table :personal_log_entries do |t|
      t.integer :word_count, default: 0
    end
  end
end
