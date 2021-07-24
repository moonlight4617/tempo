require 'test_helper'

class CalendarTest < ActiveSupport::TestCase

  def setup
    @shop = shops(:sample_shop)
    @user = users(:ryoji)
  end

  test "shopに基づかないCalendarテーブルは作成されない" do
    calendar = Calendar.new(user_id: @user.id, rent_date: "2021.07.21", start_time: "12:00:00")
    assert_not calendar.save
  end

  test "userに基づかないCalendarテーブルは作成されない" do
    calendar = Calendar.new(shop_id: @shop.id, rent_date: "2021.07.21", start_time: "12:00:00")
    assert_not calendar.save
  end

  test "rent_dateのないCaelendarテーブルは作成されない" do
    calendar = Calendar.new(shop_id: @shop.id, user_id: @user.id, start_time: "12:00:00")
    assert_not calendar.save
  end

  test "shop、userに基いていて、rent_dateに値があればCalendarテーブルを作成できる" do
    calendar = Calendar.new(shop_id: @shop.id, user_id: @user.id, rent_date: "2021.07.21", start_time: "12:00:00")
    assert calendar.save
  end
end
