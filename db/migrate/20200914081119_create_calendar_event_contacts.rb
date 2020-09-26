class CreateCalendarEventContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :calendar_event_contacts do |t|
      t.belongs_to :calendar_event
      t.belongs_to :contact
      t.timestamps
    end
  end
end
