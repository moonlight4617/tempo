require 'test_helper'

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login_user" do
    get user_sessions_login_user_url
    assert_response :success
  end

end
