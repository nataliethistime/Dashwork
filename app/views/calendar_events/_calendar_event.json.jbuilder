json.extract! calendar_event, :id, :name, :description, :start_at, :end_at, :created_at, :updated_at
json.url calendar_event_url(calendar_event, format: :json)
