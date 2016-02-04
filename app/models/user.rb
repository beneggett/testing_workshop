class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true, on: :create

  after_create :generate_user_activities

  has_many :user_activities, dependent: :destroy
  has_many :activities, through: :user_activities

  def level
    if points < 10
      'lost soul'
    elsif points < 15
      'amateur'
    elsif points < 25
      'beginner'
    elsif points < 30
      'workable'
    elsif points < 35
      'expert'
    elsif points < 40
      'rock star'
    elsif points >= 40
      'bowie'
    else
      'noob'
    end
  end

  def level_image_url
    Giphy.get(level)
  end

  def legit_name
    [FFaker::HipsterIpsum.word, name].join(' ').titleize
  end

  private
  def generate_user_activities
    Activity.all.each do |a|
      UserActivity.create(activity: a, user: self)
    end
  end
end
