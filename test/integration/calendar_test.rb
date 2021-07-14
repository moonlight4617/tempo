require 'test_helper'

class ShopReservationFrameTest < ActionDispatch::IntegrationTest
  def setup
    @shop = shops(:sample_shop)
    @available = @shop.availables.create(rent_date: "2021-07-14", start_time: "12:00:00")
  end

  test "予約枠を開放" do
    assert_difference 'Available.count', 1 do
      get s_res_path(@shop)
      post s_set_res_path(@shop), params: { rent_date: "2021-07-14", start_time: "13", end_time: "14"}
    end
  end

  test "予約する" do
    assert_difference 'Calendar.count', 1 do
      get c_new_path(@shop)
      get c_confirm_path(@shop), params: { calendar: { rent_date: ["2021-07-14, 12:00:00"]} }
      post c_create_path(@shop), params: { calendar: { candidate_days: ["2021-07-14 12:00:00"]} }
    end
  end

  # 複数日予約して、Calendarテーブルの数が増えているか
  # 過去日付を選択した際にエラーとして戻されるか
  # すでに予約が入っている日時を選択して、エラーとして戻されるか
  # 店舗が予約開放していない日時を選択してエラーとして戻されるか
  # 3ヶ月以上先の予約をした場合にエラーで戻される

end