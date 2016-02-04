class UserActivity < ActiveRecord::Base
  include ScorePoints
  belongs_to :activity
  belongs_to :user

  after_save :reflect_score

  def point_value
    5
  end

  def complete!
    update_attributes completed_at: Time.now
  end

  def incomplete!
    update_attributes completed_at: nil
  end


end
