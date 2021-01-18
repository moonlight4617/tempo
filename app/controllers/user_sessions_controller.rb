class UserSessionsController < ApplicationController
  # usersコントローラー似合った内容を移植しました。
  def new
  end

  def create
    # paramsの受け取りが出来ていませんでしたので下記のように変更しました。
    user = User.find_by(email: params[:user_session][:email])
    if user && user.authenticate(params[:user_session][:password])
      session[:user_id] = user.id
      redirect_to u_show_path
    else
      render 'login_user'
    end
  end

  def logout
    if session[:user_id]
      # セッション自体をちゃんと削除しましょう
      # session[:user_id] = nil
      session.delete(:user_id)
      redirect_to root_path
    end
  end
end
