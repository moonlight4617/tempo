require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin_user = User.create(name: "Admin User", email: "admin_user@example.com", password: "123456", password_confirmation: "123456",  public_uid: "abcde9876", admin: 1)
    @general_user = User.create(name: "Example User", email: "user@example.com", password: "123456", password_confirmation: "123456",  public_uid: "abcde1234")
    @shop = Shop.create(id: 1, name: "sample shop", zip_code: 1220012, prefecture: "東京都", city: "中野区", tel: "090111111111", station: "中野")
  end

  test "管理者権限がないユーザーの場合、admin画面に遷移出来ない" do
    # 管理者権限のないユーザーでログイン
    get user_login_path
    post user_logged_in_path, params: { user_session: { email: "user@example.com", password: "123456" } }
    assert_redirected_to s_index_path

    # 管理者権限でしか出来ないアクションを実行し、rootに戻される
    %w(user_index user_individual user_comment user_reservation user_edit owner_index owner_individual).each do |action|
      get url_for(controller: "admin", action: action)
      assert_equal "管理者権限がありません", flash[:danger]
      assert_redirected_to root_path
    end

    # user_update, user_destroyを実行し、rootに戻される
    %w(user_update user_destroy).each do |action|
      patch url_for(controller: "admin", action: action, params: { user: { id: "abcde1234"} })
      assert_equal "管理者権限がありません", flash[:danger]
      assert_redirected_to root_path
    end

    # shop_edit, shop_show,を実行し、rootに戻される
    %w(shop_show shop_edit).each do |action|
      get url_for(controller: "admin", action: action, id: 1)
      assert_equal "管理者権限がありません", flash[:danger]
      assert_redirected_to root_path
    end
 
    # shop_updateを実行し、rootに戻される
    patch url_for(controller: "admin", action: "shop_update", id: 1)
    assert_equal "管理者権限がありません", flash[:danger]
    assert_redirected_to root_path
  end
  

  # admin機能が使えるuserがuser_indexやowner_indexの画面に遷移することができるか
  test "admin機能が使えるuserの場合、管理者権限画面へアクセスできるか" do
    get user_login_path
    post user_logged_in_path, params: { user_session: { email: "admin_user@example.com", password: "123456" } }
    assert_redirected_to s_index_path

    # assert_equal(@test_user.name, @user.name)
  end


  # set_userやset_shopがbefore_loginで行われているか
end
