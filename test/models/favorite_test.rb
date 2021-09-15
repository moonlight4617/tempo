require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  def setup
    @shop = shops(:sample_shop)
    @user = users(:ryoji)
  end

  test "shopに基づいていないとfavoriteは作成されない" do
    favorite = Favorite.new(user_id: @user.id)
    assert_not favorite.save
  end

  test "userに基づいていればfavoriteは作成される" do
    favorite = Favorite.new(shop_id: @shop.id)
    assert_not favorite.save
  end

  test "user_id、shop_idが同一のfavoriteレコードは存在できない" do
    Favorite.create(shop_id: @shop.id, user_id: @user.id)
    favorite = Favorite.new(shop_id: @shop.id, user_id: @user.id)
    assert_not favorite.save
  end

  test "shop、userに基づいていれば作成される" do
    favorite = Favorite.new(shop_id: @shop.id, user_id: @user.id)
    assert favorite.save
  end

end
