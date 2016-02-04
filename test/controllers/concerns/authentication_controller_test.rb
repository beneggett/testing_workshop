require "test_helper"
class AuthenticationController < ApplicationController
  skip_before_action :authorize!
  include Authentication

  # pass in an action, and whatever method you want to call
  def initialize(method_name, &method_body)
    self.class.send(:define_method, method_name, method_body)
  end

end

class AuthenticationControllerTest < ActionController::TestCase

  def use_fake_route
    with_routing do |map|
      map.draw do
        get 'index' => 'authentication#index'
      end
      yield
    end
  end

  it "authenticates the user" do
    use_fake_route do
      user = create(:user)
      @controller = AuthenticationController.new(:index) { authenticate(user) }
      assert_nil session[:user_id]
      get :index
      assert_equal user.id, session[:user_id]
      assert_response :redirect
      assert_redirected_to '/'
      assert flash[:notice].present?
    end
  end


end
