FactoryGirl.define do
  factory :user_activity do
    activity { FactoryGirl.create :activity}
    user { FactoryGirl.create :user}
  end

end
