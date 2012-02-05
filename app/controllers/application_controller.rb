class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl

  before_filter :require_login

  def require_login
    unless current_user
      redirect_to login_path
    end
  end

  private

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
    end
  end
  helper_method :current_user


  #helper_method :current_ver
end
