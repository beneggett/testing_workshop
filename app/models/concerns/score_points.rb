module ScorePoints
  extend ActiveSupport::Concern
  included do
    after_save :reflect_score

    def reflect_score
      if self.completed_at_changed?
        if self.completed_at
          user.points += point_value
        else
          user.points -= point_value
        end
        user.save
      end
    end
  end
end
