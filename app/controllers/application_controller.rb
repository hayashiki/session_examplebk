class ApplicationController < ActionController::Base

  helper_method :current_user, :logger_in?

  private

  def require_login
    logged_in?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end
