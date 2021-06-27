require 'test_helper'

class UserSessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(name: "Example User", email: "user@example.com", password: "123456", password_confirmation: "123456")
  end

  test "ログイン出来た場合、画像一覧に遷移しているか" do
    get user_login_path
    post user_logged_in_path, params: { user_session: { email: "user@example.com", password: "123456" } }
    assert_redirected_to s_index_path
  end

  # 無効なemailまたはpasswordでログインした際の挙動のテスト

end
