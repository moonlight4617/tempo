class CalendarsController < ApplicationController
  before_action :set_shop
  def new
    @calendar = @shop.calendars.build
  end

  def create
    @calendar = @shop.calendars.create

    if params[:hour]
      p params[:hour]
      params[:hour].each do |hour|
        dayhour = hour[1].to_s.split
        p dayhour[0]
        p dayhour[1]
        p dayhour[2]
        p dayhour[3]
        p dayhour[7]
      end
    end
  end

  def move
    @day = params[:move]
    redirect_to c_new_path
  end

  def show
  end

  def edit
  end

  private

    def set_shop
      @shop = Shop.find(params[:id])
    end

    def cal_params
      params.require(:calendar).permit(:hour)
    end
end
