class RegistrationsController < ApplicationController
  include Authentication

  skip_before_action :authorize!

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    if @user.save
      authenticate(@user)
    else
      flash[:alert] = "Could not sign up, please check for errors."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
