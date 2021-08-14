require 'test_helper'

class OwnerTest < ActiveSupport::TestCase
 
  def setup
    @owner = Owner.new(name: "Example Owner", email: "owner@example.com", password: "123456", password_confirmation: "123456")
  end

  test "nameは50文字まで" do
    @owner.name = "a" * 51
    assert_not @owner.valid?
  end

  test "emailは全部で255文字まで" do
    @owner.email = "a" * 244 + "@example.com"
    assert_not @owner.valid?
  end

   test "emailはメールアドレスとしておかしいものは弾く" do
    invalid_addresses = %w[owner@example,com owner_at_foo.org owner.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @owner.email = invalid_address
      assert_not @owner.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "emailは大文字・小文字は区別しない状態で一意でなければならない" do
    duplicate_owner = @owner.dup
    duplicate_owner.email = @owner.email.upcase
    @owner.save
    assert_not duplicate_owner.valid?
  end

  test "emailは小文字変換して保存" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @owner.email = mixed_case_email
    @owner.save
    assert_equal mixed_case_email.downcase, @owner.reload.email
  end

  test "passwordはスペースではいけない" do
    @owner.password = @owner.password_confirmation = " " * 6
    assert_not @owner.valid?
  end

  test "パスワードは6文字以上でなければならない" do
    @owner.password = @owner.password_confirmation = "a" * 5
    assert_not @owner.valid?
  end
end
