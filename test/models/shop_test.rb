require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.create(name: "Example Owner", email: "owner@example.com", password: "123456", password_confirmation: "123456")
  end

  test "ownerに基づいていないshopは作成されない" do
    shop = Shop.new(name: "testshop",zip_code: 1040061, prefecture: "東京都", city: "中央区", tel: "0312345678", station: "新橋")
    assert_not shop.valid?
  end

  test "nameが空ではいけない" do
    shop = Shop.new(owner_id: @owner.id, name: "", zip_code: 1040061, prefecture: "東京都", city: "中央区", tel: "0312345678", station: "新橋")
    assert_not shop.valid?
  end

  test "nameは50文字まで" do
    shop = Shop.new(owner_id: @owner.id, name: "a" * 51, zip_code: 1040061, prefecture: "東京都", city: "中央区", tel: "0312345678", station: "新橋")
    assert_not shop.valid?
  end

  test "zip_codeが空欄ではいけない" do
    shop = Shop.new(owner_id: @owner.id, name: "testshop", prefecture: "東京都", city: "中央区", tel: "0312345678", station: "新橋")
    assert_not shop.valid?
  end

  test "prefectureが空欄ではいけない" do
    shop = Shop.new(owner_id: @owner.id, name: "testshop", zip_code: 1040061, prefecture: "", city: "中央区", tel: "0312345678", station: "新橋")
    assert_not shop.valid?
  end

  test "cityが空欄ではいけない" do
    shop = Shop.new(owner_id: @owner.id, name: "testshop", zip_code: 1040061, prefecture: "東京都", city: "", tel: "0312345678", station: "新橋")
    assert_not shop.valid?
  end

  test "telが空欄ではいけない" do
    shop = Shop.new(owner_id: @owner.id, name: "testshop", zip_code: 1040061, prefecture: "東京都", city: "中央区", tel: "", station: "新橋")
    assert_not shop.valid?
  end

  test "stationが空欄ではいけない" do
    shop = Shop.new(owner_id: @owner.id, name: "testshop", zip_code: 1040061, prefecture: "東京都", city: "中央区", tel: "0312345678", station: "")
    assert_not shop.valid?
  end

  test "ownerに基づいていて、各項目が埋まっていればshopは作成できる" do
    shop = Shop.new(owner_id: @owner.id, name: "testshop", zip_code: 1040061, prefecture: "東京都", city: "中央区", tel: "0312345678", station: "新橋")
    assert shop.valid?
  end
end
