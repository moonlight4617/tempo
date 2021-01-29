class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy, :completely_destroy]
  before_action :set_owner, only: [:create, :show]
  before_action :before_login_owner, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_owner, only: [:edit, :update, :destroy]
  
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = @owner.shops.create(shop_params)
    if @shop.save
      redirect_to s_show_path(@shop)
    else
      render 'new'
    end
  end

  def show
    @owner = @shop.owner
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to s_show_path(@shop)
    else
      render 'edit'
    end
  end

  def destroy
    @shop.del_flg = 1
    @shop.save
    redirect_to s_index_path
  end

  def zip
    p params
  end

  private

    def shop_params
      params.require(:shop).permit(:name, :prefecture, :city, :address, :tel, :station, :capacity, :image, :price, :content, :zip_code)
    end

    def set_shop
      @shop = Shop.find_by(id: params[:id])
    end

    def set_owner
      @owner = Owner.find_by(id: session[:owner_id])
    end

    def correct_owner
      set_shop
      set_owner
      if @shop.owner != @owner
        redirect_to root_path
      end
    end
end
