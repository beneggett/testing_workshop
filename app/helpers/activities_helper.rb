module ActivitiesHelper
  def complete_activity_link(user_activity)
    if user_activity.completed_at?
      link_to "<i class='fa fa-check'></i>".html_safe, incomplete_activity_path(user_activity)
    else
      link_to "<i class='fa fa-circle-o'></i>".html_safe, complete_activity_path(user_activity)
    end
  end
end
