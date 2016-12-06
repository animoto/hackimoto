class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.email
    redirect_to hackimotos_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to hackimotos_path
  end
end