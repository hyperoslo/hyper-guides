class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    AdminUser.find session[:user_id] if session[:user_id]
  end
end
