class CreateCalendarEventProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :calendar_event_projects do |t|
      t.belongs_to :calendar_event
      t.belongs_to :project
      t.timestamps
    end
  end
end
