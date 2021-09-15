require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  def setup
    @shop = shops(:sample_shop)
    @user = users(:ryoji)
  end

  test "shopに基づいていないとchatは作成されない" do
    chat = Chat.new(user_id: @user.id)
    assert_not chat.save
  end

  test "userに基づいていないとchatは作成されない" do
    chat = Chat.new(shop_id: @shop.id)
    assert_not chat.save
  end
  
  test "shop、userに基づいていればchatは作成される" do
    chat = Chat.new(shop_id: @shop.id, user_id: @user.id)
    assert chat.save
  end
end
