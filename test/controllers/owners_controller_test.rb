require 'test_helper'

class OwnersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @owner = Owner.new(name: "Example Owner", email: "owner@example.com", password: "123456", password_confirmation: "123456")
  end

  test "owner_should be valid" do
    assert @owner.valid?
  end

  test "owner_name should be present" do
    @owner.name = ""
    assert_not @owner.valid?
  end

  test "owner_email should be present" do
    @owner.email = " "
    assert_not @owner.valid?
  end

  test "owner_password should be present" do
    @owner.password = " "
    assert_not @owner.valid?
  end

  test "owner_password_confirmation should be present" do
    @owner.password_confirmation = " "
    assert_not @owner.valid?
  end

  test "owner_password & owner_password_confirmation should not be difference" do
    @owner.password = "foo"
    @owner.password_confirmation = "bar"
    assert_not @owner.valid?
  end

  test "owner_password & owner_password_confirmation should be same" do
    @owner.password = "foobar"
    @owner.password_confirmation = "foobar"
    assert @owner.valid?
  end
end
