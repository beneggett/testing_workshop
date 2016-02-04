class SessionsController < ApplicationController
  include Authentication

  skip_before_action :authorize!

  def new
  end

  def create
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
      authenticate(user)
    else
      flash.now.alert = "Uh, uh, uh. You didn't say the magic word!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out successfully"
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
