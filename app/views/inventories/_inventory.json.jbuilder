json.extract! inventory, :id, :serial_number, :model, :quantity, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
