require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "123456", password_confirmation: "123456")
  end

  test "user_should be valid" do
    assert @user.valid?
  end

  test "user_name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "user_email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "user_password should be present" do
    @user.password = " "
    assert_not @user.valid?
  end

  test "user_password_confirmation should be present" do
    @user.password_confirmation = " "
    assert_not @user.valid?
  end

  test "user_password & user_password_confirmation should not be difference" do
    @user.password = "foo"
    @user.password_confirmation = "bar"
    assert_not @user.valid?
  end

  test "user_password & user_password_confirmation should be same" do
    @user.password = "foobar"
    @user.password_confirmation = "foobar"
    assert @user.valid?
  end
end
