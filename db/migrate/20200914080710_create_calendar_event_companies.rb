class CreateCalendarEventCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :calendar_event_companies do |t|
      t.belongs_to :calendar_event
      t.belongs_to :company
      t.timestamps
    end
  end
end
