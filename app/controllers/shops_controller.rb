class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to s_show_path
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
      params.require(:shop).permit(:prefecture, :city, :address, :tel, :station, :capacity, :image, :price, :content)
    end

    def set_shop
      @shop = Shop.find_by(id: params[:id])
    end
end
