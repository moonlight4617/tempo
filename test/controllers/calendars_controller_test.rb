require 'test_helper'

class CalendarsControllerTest < ActionDispatch::IntegrationTest

  # Date.todayの日付が表示されているか
  # nextを押した際にDate.todayの７日間後が表示されているか
  # prevを押した際にDate.todayの７日間前が表示されているか
  # 日時をチェックして申込画面へを押すと確認画面へと遷移しているか
  # 確認画面から戻るボタンを押すと選択画面へ遷移しているか
  # 確認画面から確定すると確定画面へと遷移しているか

  def setup
    @shop = shops(:sample_shop)
    @available = availables(:one)
    # @user = users(:ryoji)
    @user = User.create(name: "Example User", email: "user@example.com", password: "123456", password_confirmation: "123456")
    # session[:user_id] = @user.id
  end

  test "予約枠を開放" do
    assert_difference 'Available.count', 1 do
      get s_res_path(@shop)
      post s_set_res_path(@shop), params: { rent_date: "2021-07-14", start_time: "13", end_time: "14"}
    end
  end

  test "予約する" do
    assert_difference 'Calendar.count', 1 do
      get user_login_path
      post user_logged_in_path, params: { user_session: { email: "user@example.com", password: "123456" } }
      assert_redirected_to s_index_path
      get c_new_path(@shop)
      get c_confirm_path(@shop), params: { calendar: { rent_date: ["2021-07-14, 12:00:00"]} }
      post c_create_path(@shop), params: { calendar: { candidate_days: "2021-07-14 12:00:00"} }
    end
  end

end
