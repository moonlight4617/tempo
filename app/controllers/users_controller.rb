class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザー登録されました"
      redirect_to u_show_path(@user)
    else
      render 'new'
    end
  end

  def show
    if @user == nil
      redirect_to root_path
    else
      @calendars = Calendar.where(user_id: session[:user_id]).limit(1)
    end
  end

  def edit
    if @user == nil
      redirect_to root_path
    end
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
      params.require(:user).permit(:name, :address, :tel, :email, :password, :password_confirmation,:image)
    end

    def set_user
      @user = User.find_by(id: session[:user_id])
    end

end
