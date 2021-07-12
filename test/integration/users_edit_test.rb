require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:ryoji)
  end

  test "user編集時のパスワードと確認パスワードが違ければ更新できない" do
    get u_edit_path
    name  = "Foo Bar"
    email = "foo@invalid"
    patch u_update_path(@user), params: { user: { name: name, email: email, password: "foo", password_confirmation: "bar" } }
    assert_not_equal name, @user.name
    assert_not_equal email, @user.email
  end

end
