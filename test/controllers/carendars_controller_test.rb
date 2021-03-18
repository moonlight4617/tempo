require 'test_helper'

class CarendarsControllerTest < ActionDispatch::IntegrationTest
  
  test "should get new" do
    get calendars_new_url
    assert_response :success
  end

  test "should calendar index" do
    get c_index_url
    assert_response :success
  end
  
  test "should calendar new" do
    get c_new_url
    assert_response :success
  end

  test "should get show" do
    get carendars_show_url
    assert_response :success
  end

  test "should get edit" do
    get carendars_edit_url
    assert_response :success
  end

end
