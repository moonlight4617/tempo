require 'test_helper'

class AvailableTest < ActiveSupport::TestCase

  def setup
    @shop = shops(:sample_shop)
  end

  test "shopに基づかないAvailableテーブルは作成できない" do
    available = Available.new(rent_date: "2021.07.21", start_time: "23:00:00")
    assert_not available.save
  end
  
  test "shopに基づいていればAvailableテーブルは作成できる" do
    available = Available.new(rent_date: "2021.07.21", start_time: "23:00:00", shop_id: @shop.id)
    assert available.save
  end

  test "shop_id、rent_date、start_time全てが重複するテーブルは作成されない" do
    Available.create(rent_date: "2021.07.21", start_time: "23:00:00", shop_id: @shop.id)
    available = Available.new(rent_date: "2021.07.21", start_time: "23:00:00", shop_id: @shop.id)
    assert_not available.save
  end

  test "shop_id、rent_date、start_time全てが重複していなければテーブルは作成される" do
    Available.create(rent_date: "2021.07.21", start_time: "23:00:00", shop_id: @shop.id)
    available = Available.new(rent_date: "2021.07.21", start_time: "22:00:00", shop_id: @shop.id)
    assert available.save
  end
end
