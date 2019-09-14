json.extract! user, :id, :email, :session_token, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
