require 'test_helper'

describe ActivitiesHelper do

  it "generates a link for a completed activity" do
    user_activity = create(:user_activity, completed_at: Time.now)
    assert_equal complete_activity_link(user_activity),  link_to("<i class='fa fa-check'></i>".html_safe, incomplete_activity_path(user_activity) )
  end

  it "generates a link for an incompleted activity" do
    user_activity = create(:user_activity, completed_at: nil)
    assert_equal complete_activity_link(user_activity),  link_to("<i class='fa fa-circle-o'></i>".html_safe, complete_activity_path(user_activity) )
  end
end
