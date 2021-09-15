require 'test_helper'

class TagTest < ActiveSupport::TestCase

  test "nameは存在しなければいけない" do
    tag = Tag.new()
    assert_not tag.valid?
  end

  test "nameは一意でなければいけない" do
    Tag.create(name: "タグネーム")
    tag = Tag.new(name: "タグネーム")
    assert_not tag.valid?
  end

  test "nameが存在し、一意であれば有効" do
    tag = Tag.new(name: "タグネーム")
    assert tag.valid?
  end
end
