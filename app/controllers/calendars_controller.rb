class CalendarsController < ApplicationController
  before_action :set_shop, except: :index_for_user

  def index_for_user
    @calendars = Calendar.where(user_id: session[:user_id])
  end

  def new
    @calendars = @shop.calendars.where(shop_id: params[:id])
    @today = Date.today
    @year = @today.year
    @year_month = "#{@today.year} / #{@today.month}"
    set_calendar
  end


  def create
    params[:calendar][:rent_date].each do |reserve|
      res = reserve.split
      @calendar = @shop.calendars.create(
            rent_date: res[0],
            start_time: res[1],            
            user_id: session[:user_id]
          )
    end
    redirect_to c_index_path
  end

  def next
    today = params[:calendar].to_date
    @today = today + 7
    @year = @today.year
    @year_month = "#{@today.year} / #{@today.month}"
    set_calendar
  end

  def prev
    today = params[:calendar].to_date
    @today = today - 7
    @year = @today.year
    @year_month = "#{@today.year} / #{@today.month}"
    set_calendar
    render 'next'
  end

  def s_index
    @calendars = @shop.calendars.where(user_id: session[:user_id])
  end

  def edit
  end

  def owner_new
    
  end

  private

    def set_shop
      @shop = Shop.find(params[:id])
    end

    def cal_params
      params.require(:calendar).permit(:hour, :rent_date[], :date, :calendar)
    end

    def set_calendar
        @week = []
      7.times do |i|
        w = @today + i
        @week.push(w)
      end

      rent_dayTimes = Calendar.where(shop_id: params[:id]).pluck(:rent_date, :start_time)
      @able_time = [9, 10, 11, 12, 13, 14, 15, 16]
      @t = []
      @rentDays = []

      rent_dayTimes.each do |dayTime|
        s_rent = "#{dayTime[0]}, #{dayTime[1]}"
        @rentDays.push(s_rent)
      end
      
      @able_time.each do |t|
        @week.each do |w|
          dt = Time.zone.local(@year, @today.month, w.mday, t)
          calendar_date = dt.to_s
          c_date = calendar_date.split
          c_dateTime = c_date[0] + ", " + c_date[1]
          # @t.map {|day| if rent_days.include?(day)? day = "x"}
          @t.push(c_dateTime)
        end
      end
    end
end
