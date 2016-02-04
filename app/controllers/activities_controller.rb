class ActivitiesController < ApplicationController

  def complete
    a = UserActivity.find(params[:id])
    a.complete!
    redirect_to root_url, notice: "You've completed #{a.activity.name}!"
  end

  def incomplete
    a = UserActivity.find(params[:id])
    a.incomplete!
    redirect_to root_url, alert: "You didn't complete #{a.activity.name}!"
  end


end
