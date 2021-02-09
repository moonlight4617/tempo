class ChatsController < ApplicationController
  before_action :set_shop
  before_action :set_chat

  def show
    if @chat != nil
      @messages = Message.where(chat_id: @chat.id)
    end
  end

  private
    def set_shop
      @shop = Shop.find(params[:id])
    end

    def set_chat
      @chat = Chat.find_by(shop_id: params[:id], user_id: session[:user_id])
    end
end
