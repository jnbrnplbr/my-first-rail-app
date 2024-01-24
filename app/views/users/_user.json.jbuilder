json.extract! user, :id, :description, :code, :menu_actions, :created_by, :created_at, :updated_at
json.url user_url(user, format: :json)
