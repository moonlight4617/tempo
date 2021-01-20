require 'test_helper'

class OwnerSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get owner_sessions_new_url
    assert_response :success
  end

end
