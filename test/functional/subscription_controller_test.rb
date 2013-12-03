require 'test_helper'

class SubscriptionControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
