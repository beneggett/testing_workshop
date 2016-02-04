module ScorePoints
  extend ActiveSupport::Concern
  included do
    def reflect_score
      if self.completed_at
        user.points += point_value
      else
        user.points -= point_value
      end
      user.save
    end
  end
end
