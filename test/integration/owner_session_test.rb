require 'test_helper'

class OwnersSessionTest < ActionDispatch::IntegrationTest

  def setup
    @owner = owners(:owner_ryoji)
  end

  test "Eメールやパスワードが空の場合はログインできない" do
    get owner_login_path
    post owner_logged_in_path, params: { email: "", password: "" }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "正常なログイン、及びログアウト" do
    get owner_login_path
    post owner_logged_in_path, params: { email: @owner.email, password: 'password' }
    assert_not session[:owner_id].nil?
    follow_redirect!
    delete owner_logout_path
    assert session[:owner_id].nil?
  end
  
  test "login_owner with remembering and without remembering" do
    # クッキーを保存してログイン
    get owner_login_path
    post owner_logged_in_path, params: { email: @owner.email, password: 'password', remember_owner: '1' }
    assert_not_empty cookies['remember_owner_token']
    delete owner_logout_path
    # クッキーを削除してログイン
    post owner_logged_in_path, params: { email: @owner.email, password: 'password', remember_owner: '0' }
    assert_empty cookies['remember_owner_token']
  end

end