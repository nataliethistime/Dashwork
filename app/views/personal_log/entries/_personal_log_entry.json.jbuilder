json.extract! personal_log_entry, :id, :content, :entered_at
json.url personal_log_entry_url(personal_log_entry, format: :json)
