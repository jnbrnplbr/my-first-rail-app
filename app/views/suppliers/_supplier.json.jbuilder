json.extract! supplier, :id, :name, :email, :point_person, :contact_number, :created_by, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
