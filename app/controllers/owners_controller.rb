class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]
  before_action :before_login_owner, except: [:new, :create]

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      session[:owner_id] = @owner.id
      redirect_to s_new_path
    else
      render 'new'
    end
  end

  def show
    @shops = @owner.shops
  end

  def edit
  end

  def update
    if @owner.update(owner_params)
      redirect_to o_show_path
    else
      render 'new'
    end
  end

  def destroy
    @owner.del_flg = 1
    @owner.save
    redirect_to root_path
  end

  private

    def owner_params
      params.require(:owner).permit(:name, :address, :tel, :email, :password, :password_confirmation)
    end

    def set_owner
      @owner = Owner.find_by(id: session[:owner_id])
    end
end
