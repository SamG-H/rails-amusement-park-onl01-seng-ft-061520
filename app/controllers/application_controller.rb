class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def redirect_if_not_authorized
    redirect_to '/' unless authorized?
  end

  def authorized?
    session[:user_id] && params[:id] == session[:user_id].to_s
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
