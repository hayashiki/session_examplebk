module RequestSpecHelper
  def login_as(user)
    post '/login', params: {
      email: 'garrett@example.com',
      password: 'password'
    }
  end

  def logout
    delete '/logout'
  end
end

RSpec.configure do |config|
  config.include RequestSpecHelper, type: :request
end
