class UsersController < ApplicationController

  include UserSessionsHelper
  before_action :set_user, only: [:show, :edit, :update, :destroy, :my_favorite, :comment]
  before_action :user_exist?, only: [:show, :edit, :update, :destroy]

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
      flash[:warning] = "登録情報が正しく入力されていません"
      render 'new'
    end
  end

  def show
    @furture_calendars = Calendar.where(user_id: session[:user_id], rent_date: Date.today..Float::INFINITY)
    @past_calendars = Calendar.where.not(user_id: session[:user_id], rent_date: Date.today..Float::INFINITY)
    @evaluations = @user.evaluations.limit(3)
    @rate = @user.evaluations.average(:rate)
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "ユーザー情報が更新されました"
      redirect_to u_show_path
    else
      render 'new'
    end
  end
  
  def destroy
    @user.update(del_flg: 1)
    flash[:info] = "ユーザー情報は削除されました"
    log_out
    redirect_to root_path
  end
  
  # オーナー側が見るユーザープロフィール
  def show_for_owner
    @user = User.find_by(public_uid: params[:format])
    @resevation = @user.calendars.size
    @evaluations = Evaluation.where(user_id: @user.id, toshop: nil).limit(10)
    @rate = Evaluation.where(toshop: nil).average(:rate)
  end

  def my_favorite
    @favorites = @user.favorites.includes(shop: :tags)
  end

  def comment
    @evaluations = @user.evaluations.page(params[:page]).per(50)
  end

  private

    def user_params
      params.require(:user).permit(:name, :address, :tel, :email, :password, :password_confirmation,:image)
    end

    def set_user
      @user = User.find_by(id: session[:user_id])
    end

    def user_exist?
      if @user == nil || @user.del_flg == 1
        redirect_to root_path
        flash[:warning] = "ログインまたは新規登録してください"
      else
        current_user
      end
    end
end
