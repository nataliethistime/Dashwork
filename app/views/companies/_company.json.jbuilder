json.extract! company, :id, :name, :description, :website, :email, :phone, :created_at, :updated_at
json.url company_url(company, format: :json)
