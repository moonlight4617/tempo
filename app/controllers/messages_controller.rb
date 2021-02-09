class MessagesController < ApplicationController

  def new

  end

  def create
    @chat = Chat.find_by(shop_id: params[:id], user_id: session[:user_id]) || Chat.create(shop_id: params[:id], user_id: session[:user_id])
    @chat.save
    p @chat.id
    @message = @chat.messages.build(content: params[:content])
    if @message.save
      respond_to do |format|
        format.html { redirect_to ch_show_path(params[:id]) }
        format.json
      end
    else
      render 'new'
    end
  end

  def destroy

  end

  private

    def set_shop
      @shop = Shop.find(params[:id])
    end

    def message_params
      params.permit(:content)
    end
end
