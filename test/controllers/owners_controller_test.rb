require 'test_helper'

class OwnersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @owner = Owner.new(name: "Example Owner", email: "owner@example.com", password: "123456", password_confirmation: "123456")
  end

  test "正常なownerの登録" do
    assert @owner.valid?
  end

  test "ownerの名前が空ではいけない" do
    @owner.name = ""
    assert_not @owner.valid?
  end

  test "owner_emailが空ではいけない" do
    @owner.email = " "
    assert_not @owner.valid?
  end

  test "owner_passwordが空ではいけない" do
    @owner.password = " "
    assert_not @owner.valid?
  end

  test "owner_password_confirmationが空ではいけない" do
    @owner.password_confirmation = " "
    assert_not @owner.valid?
  end

  test "owner_passwordとowner_password_confirmationが違う" do
    @owner.password = "foo"
    @owner.password_confirmation = "bar"
    assert_not @owner.valid?
  end

  test "owner_passwordとowner_password_confirmationが同じ" do
    @owner.password = "foobar"
    @owner.password_confirmation = "foobar"
    assert @owner.valid?
  end
end
