class CreatePersonalLogEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_log_entries do |t|
      t.text :content
      t.datetime :date
      t.belongs_to :tenant
      t.belongs_to :user
      t.timestamps
    end

    change_table :tenants do |t|
      t.boolean :personal_log_app, default: false
    end
  end
end
