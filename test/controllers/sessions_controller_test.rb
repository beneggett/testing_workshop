require 'test_helper'

describe SessionsController do

  it "gets the new action" do
    get :new
    assert_response :success
    assert_template :new
  end

  it "signs in a user with good credentials" do
    u = create(:user, password: 'my_test')
    post :create, user: {email: u.email, password: 'my_test'}
    assert_response :redirect
    assert session[:user_id].present?
    assert_redirected_to root_path
  end

  it "doesn't sign in a user with bad credentials" do
    u = create(:user, password: 'my_test')
    post :create, user: {email: u.email, password: 'bad_password'}
    assert_response :success
    assert_template :new
    assert flash[:alert].present?
  end

  it 'clears a users session on sign out' do
    session[:user_id] = 1234567
    delete :destroy
    assert_nil session[:user_id]
    assert_response :redirect
    assert_redirected_to root_path
    assert flash[:notice].present?
  end
end
