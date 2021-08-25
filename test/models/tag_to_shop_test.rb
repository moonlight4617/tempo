require 'test_helper'

class TagToShopTest < ActiveSupport::TestCase

  def setup
    @shop = shops(:sample_shop)
  end

  test "tagモデルに基づいていなければtag_to_shopは生成されない" do
    tag_to_shop = TagToShop.create(shop_id: @shop.id)
    assert_not tag_to_shop.valid?
  end

  test "shopモデルに基づいていなければtag_to_shopは生成されない" do
    tag = Tag.create(name: "テスト")
    tag_to_shop = TagToShop.create(tag_id: tag.id)
    assert_not tag_to_shop.valid?
  end

  test "同一のshop_idにおいて、tag_idは一意でなければいけない" do
    tag = Tag.create(name: "テスト")
    TagToShop.create(tag_id: tag.id, shop_id: @shop.id)
    tag_to_shop = TagToShop.create(tag_id: tag.id, shop_id: @shop.id)
    assert_not tag_to_shop.valid?
  end

  test "tag,shopモデルに基づいていて、shop_id,tag_idが一意であればtag_to_shopは生成できる" do
    tag = Tag.create(name: "テスト")
    tag_to_shop = TagToShop.create(tag_id: tag.id, shop_id: @shop.id)
    assert tag_to_shop.valid?
  end

end
