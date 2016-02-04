require 'test_helper'

describe StaticController do

  it "gets the home action" do
    get :home
    assert_response :success
    assert_template :home
  end

end
