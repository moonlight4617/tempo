require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @user = users(:ryoji)
    @shop = shops(:sample_shop)
    @chat = Chat.create(shop_id: @shop.id, user_id: @user.id)
  end

  test "chatに基づいていないとmessageは作成されない" do
    message = Message.new(content: "テスト")
    assert_not message.save
  end

  test "contentがないmessageは作成されない" do
    message = Message.new(chat_id: @chat.id)
    assert_not message.save
  end

  test "chatに基づいていて、contentがあるmessageは作成される" do
    message = Message.new(chat_id: @chat.id, content: "テスト")
    assert message.save
  end
end
