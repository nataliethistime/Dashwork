json.extract! contact, :id, :name, :description, :website, :email, :phone, :created_at, :updated_at
json.url contact_url(contact, format: :json)
