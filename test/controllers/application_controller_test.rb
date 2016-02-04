require "test_helper"
class FakeApplicationController < ApplicationController
  # pass in an action, and whatever method you want to call
  def initialize(method_name, &method_body)
    self.class.send(:define_method, method_name, method_body)
  end
end

class ApplicationControllerTest < ActionController::TestCase

  def use_fake_route
    with_routing do |map|
      map.draw do
        get 'index' => 'fake_application#index'
      end
      yield
    end
  end

  it "authenticates the user" do
    use_fake_route do
      @controller = FakeApplicationController.new(:index) { authorize! }
      get :index
      assert_response :redirect
      assert_redirected_to '/sign-in'
    end
  end


end
