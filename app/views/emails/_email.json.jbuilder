json.extract! email, :id, :session_token, :password_digest, :created_at, :updated_at
json.url email_url(email, format: :json)
