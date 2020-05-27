class CreateCalendarEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :calendar_events do |t|
      t.string :name
      t.text :description
      t.datetime :start_at
      t.datetime :end_at

      t.integer :user_id, null: false
      t.integer :tenant_id, null: false

      t.timestamps
    end
  end
end
