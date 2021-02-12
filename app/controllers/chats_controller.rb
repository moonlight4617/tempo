class ChatsController < ApplicationController
  before_action :set_shop
  before_action :set_chat, only: :show

  def new
    
  end

  def show
    if @chat != nil
      @messages = Message.where(chat_id: @chat.id)
      @message = @chat.messages.create(content: params[:content])
    end
  end

  def message
    @chat = Chat.find_by(shop_id: params[:id], user_id: session[:user_id]) || Chat.create(shop_id: params[:id], user_id: session[:user_id])
    @messages = @chat.messages
    @message = @chat.messages.build(content: params[:message][:content])
    respond_to do |format|
      if @message.save
        format.html { redirect_to ch_show_path(params[:id]) }
        format.js
      else
        format.html { render :new }
        format.js { render :errors }
      end
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
