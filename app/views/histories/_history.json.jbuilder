json.extract! history, :id, :name, :action, :description, :module_id, :created_at, :updated_at
json.url history_url(history, format: :json)
