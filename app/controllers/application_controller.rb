class ApplicationController < ActionController::Base
  protect_from_forgery
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by email: (session[:user_id]) if session[:user_id]
  end

  def super_admin_required
    if !current_user.is_super_admin?
      redirect_to hackimotos_path
    end
  end
end
