class OwnerSessionsController < ApplicationController

  def new
  end

  def create
    owner = Owner.find_by(email: params[:owner_session][:email])
    if owner && owner.authenticate(params[:owner_session][:password])
      session[:owner_id] = owner.id
      params[:owner_session][:remember_me] == 1 ? remember(owner) : forget(owner)
      redirect_to o_show_path
    else
      render 'new'
    end
  end

  def logout
    if session[:owner_id]
      session.delete(:owner_id)
      redirect_to root_path
    end
  end

  private

    def remember(owner)
      owner.save_remember_digest
      cookies.permanent.signed[:owner_id] = owner.id
      cookies.permanent[:remember_token] = owner.remember_token
    end

    def forget(owner)
      owner.forget_remember_digest
      cookies.delete(:owner_id)
      cookies.delete(:remember_token)
    end
end
