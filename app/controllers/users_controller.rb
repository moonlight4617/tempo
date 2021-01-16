class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to u_show_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to u_show_path
    else
      render 'new'
    end
  end

  def destroy
    @user.del_flg = 1
    @user.save
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:address, :tel, :email, :password, :password_confirm)
    end

    def set_user
      @user = User.find_by(id: params[:id])
    end

end
