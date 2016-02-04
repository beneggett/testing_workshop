require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase

  test "it gets the new action" do
    get :new
    assert_response :success
    assert_template :new
  end

  it "signs in a user with good credentials" do
    post :create, user: attributes_for(:user)
    assert_response :redirect
    assert session[:user_id].present?
    assert_redirected_to root_path
  end

  it "doesn't sign in a user with bad credentials" do
    post :create, user: attributes_for(:user, email: nil)
    assert_response :success
    assert_template :new
    assert flash[:alert].present?
  end

end
