require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # Make tests, not war

  it "responds to activities" do
    User.new().must_respond_to :activities
  end

  it "responds to user_activities" do
    User.new().must_respond_to :user_activities
  end

  it "creates a valid user" do
    u = build(:user)
    assert u.valid?
  end

  it "can't create a  user without an email" do
    u = build(:user, email: nil)
    refute u.valid?
    assert u.errors.present?
    assert u.errors.messages.include? :email
  end

  it "can't create a user without a name" do
    u = build(:user, name: nil)
    refute u.valid?
    assert u.errors.present?
    assert u.errors.messages.include? :name
  end

  it "can't create a user without a password" do
    u = build(:user, password: nil)
    refute u.valid?
    assert u.errors.present?
    assert u.errors.messages.include? :password
  end

  it "gives a legit name" do
    # [FFaker::HipsterIpsum.word, name].join(' ').titleize
    u = build(:user)
    assert u.legit_name.include? u.name.titleize
    refute_equal u.legit_name, u.name
  end

  it "sets up user activities after a user is created" do
    3.times do
      create(:activity)
    end
    assert_equal UserActivity.count, 0
    u = create(:user)
    assert_equal UserActivity.count, 3

  end

end

