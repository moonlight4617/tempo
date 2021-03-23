require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest

  test "invalid signup_for_user information" do
    get u_new_path
    assert_no_difference 'User.count' do
      post u_create_path, params: { user: { name:  "", email: "user@invalid", password: "foo", password_confirmation: "bar" } }
    end
  end
  
  test "invalid signup_for_owner information" do
    get u_new_path
    assert_no_difference 'Owner.count' do
      post o_create_path, params: { owner: { name:  "", email: "owner@invalid", password: "foo", password_confirmation: "bar" } }
    end
  end
end