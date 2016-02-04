FactoryGirl.define do
  factory :user do
    email     { FFaker::Internet.email }
    name      { FFaker::Name.name }
    password 'Password123456'
  end
end
