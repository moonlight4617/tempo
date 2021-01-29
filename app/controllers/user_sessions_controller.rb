class UserSessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:user_session][:email])
    if user && user.authenticate(params[:user_session][:password])
      session[:user_id] = user.id
      if session[:owner_id]
        session[:owner_id].delete
      end
      params[:user_session][:remember_me] == 1 ? remember(user) : forget(user)
      redirect_back_or(s_index_path)
    else
      render 'new'
    end
  end

  def logout
    if session[:user_id]
      session.delete(:user_id)
      redirect_to root_path
    end
  end

  private

    def remember(user)
      user.save_remember_digest
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
    end

    def forget(user)
      user.forget_remember_digest
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
    end
end
