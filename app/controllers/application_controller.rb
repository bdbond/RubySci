class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  def require_login
    unless current_user
      redirect_to login_path
    end
  end

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
    end

  end
  helper_method :current_user

  def current_ver
    "v0.1"
  end
  helper_method :current_ver
end
