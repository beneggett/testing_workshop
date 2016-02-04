class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :authorize!

  private

  def current_user
    begin
    @current_user ||=  User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
    end
  end
  helper_method :current_user


  def authorize!
    redirect_to sign_in_path, alert: "Not so fast! You need to sign in before going there!" if current_user.nil?
  end
end
