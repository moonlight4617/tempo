require 'test_helper'

class TagToShopTest < ActiveSupport::TestCase

  # test "tagモデルに基づいていなければtag_to_shopは生成されない" do
  #   Tag.create(name: "タグネーム")
  #   tag = Tag.new(name: "タグネーム")
  #   assert_not tag.valid?
  # end

  # shopモデルに基づいていなければtag_to_shopは生成されない
  # 同一のshop_idにおいて、tag_idは一意でなければいけない
  # tag,shopモデルに基づいていて、shop_id,tag_idが一意であればtag_to_shopは生成できる

end
