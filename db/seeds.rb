UserActivity
Activity.destroy_all

["Models", "Controllers", "Helpers", "Model Concerns in Isolation", "Controller Concerns in Isolation", "ApplicationController methods in Isolation", "Views?", "Mailers", "Dependencies on external services", "Acceptance with Capybara", "Gems"].each do |test_method|

  Activity.create name: "Learn to test: #{test_method}"
end

User.all.each do |u|
  u.update_attributes points: 0
  u.send(:generate_user_activities)
end
