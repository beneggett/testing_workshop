require 'test_helper'

class ScorePointsTest < ActiveSupport::TestCase

  before do
    @score_pointable = Struct.new(:completed_at, :point_value, :user) {include ::ScorePoints }
    @user = create(:user)
  end

  it 'tests that points get added to user when completed at is set' do
    test_model = @score_pointable.new Time.now, 5, @user
    assert_equal 0, @user.points
    test_model.reflect_score
    assert_equal 5, @user.points
  end

  it 'tests that points get subtracted to user when completed at is nil' do
    @user.update_attributes points: 5
    test_model = @score_pointable.new nil, 5, @user
    assert_equal 5, @user.points
    test_model.reflect_score
    assert_equal 0, @user.points
  end


end

