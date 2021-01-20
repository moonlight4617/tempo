class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :set_owner, only: [:create, :show]
  
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
    redirect_to root_path
  end

  private

    def shop_params
      params.require(:shop).permit(:name, :prefecture, :city, :address, :tel, :station, :capacity, :image, :price, :content)
    end

    def set_shop
      @shop = Shop.find_by(id: params[:id])
    end

    def set_owner
      @owner = Owner.find_by(id: session[:owner_id])
    end
end
