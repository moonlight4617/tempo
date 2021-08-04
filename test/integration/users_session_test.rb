require 'test_helper'

class UsersSessionTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:ryoji)
  end

  test "Eメール、パスワードが空であればログインできない" do
    get user_login_path
    post user_logged_in_path, params: { user_session: { email: "", password: "" } }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "userの正常なログイン及びログアウト" do
    get user_login_path
    post user_logged_in_path, params: { user_session: { email: @user.email, password: 'password' } }
    assert  is_logged_in?
    follow_redirect!
    delete user_logout_path
    assert_not is_logged_in?
  end

  test "userログイン時のremember_meが機能しているか" do
    # クッキーを保存してログイン
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies['remember_token']
    delete user_logout_path
    # クッキーを削除してログイン
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end

end