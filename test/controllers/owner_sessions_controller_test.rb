require 'test_helper'

class OwnerSessionsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @owner = Owner.create(name: "Example owner", email: "owner@example.com", password: "123456", password_confirmation: "123456")
  end

  test "正常にログインした後の画面遷移ができているか" do
    get owner_login_path
    post owner_logged_in_path, params: { email: "owner@example.com", password: "123456" }
    assert_redirected_to o_show_path
  end

  # 無効なemailまたはpasswordでログインした際の挙動のテスト

end
