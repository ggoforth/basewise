class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    #user find_by_id as it won't throw an exception
    #if session[:user_id] is nil
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def login_as(user)
    return nil unless user
    session[:user_id] = user.id
    @current_user = user
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
