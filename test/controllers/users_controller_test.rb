require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get u_new_url
    assert_response :success
  end

  test "should get show" do
    get u_show_url
    assert_response :success
  end

  test "should get edit" do
    get u_edit_url
    assert_response :success
  end

end
