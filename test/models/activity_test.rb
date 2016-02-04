require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  # Make tests, not war

  it "responds to users" do
    Activity.new().must_respond_to :users
  end

  it "responds to user_activities" do
    Activity.new().must_respond_to :user_activities
  end

end

