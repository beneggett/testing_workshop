class Activity < ActiveRecord::Base
  has_many :user_activities, dependent: :destroy
  has_many :users, through: :user_activities

end
