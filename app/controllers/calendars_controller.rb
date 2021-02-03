class CalendarsController < ApplicationController
  before_action :set_shop, except:[:index]

  def index
    @calendars = Calendar.where(user_id: session[:user_id])
  end

  def new
    @today = Date.today
    @year = @today.year
    @year_month = "#{@today.year} / #{@today.month}"
    @week = []
    7.times do |i|
      w = @today + i
      @week.push(w)
    end

    @able_time = [9, 10, 11, 12, 13, 14, 15, 16]
    @t = []
    @able_time.each do |t|
      @week.each do |w|
        dt = Time.zone.local(@year, @today.month, w.mday, t)
        @t.push(dt)
      end
    end

    # @calendars.each do |res|
    #   res.to_date
    # end
    @calendars = @shop.calendars.where(shop_id: params[:id])
  end

  def create
    params[:calendar][:rent_date].each do |reserve|
      @calendar = @shop.calendars.create(
            rent_date: reserve.to_date,
            start_time: reserve.to_time,
            user_id: session[:user_id]
          )
    end
    redirect_to c_index_path
  end

  # def new
  #   @calendar = @shop.calendars.build
  # end

  # def create
  #     params[:hour][:day].each do |hour|
  #       p hour
  #       reserve = hour.split
  #       p reserve[0]
  #       d = Time.at(reserve[0].to_i)
  #       p d
  #       a = d.to_s
  #       b = a.split
  #       p b[0]

  #       if @calendar = @shop.calendars.create(
  #         rent_date: b[0],
  #         start_time: reserve[1]
  #       )
        # @calendar = @shop.calendars.create(
          # res_date = []
          # res_date.push(reserve[3], reserve[1], reserve[2])
          # join_date = res_date.join(',')
          
          # @calendar = @shop.calendars.create(
          #   rent

          # p res_date
          # rent_date: [:hour],
          # )
  #       redirect_to c_show_path
  #       end
  #     end

  # end

  def next
    p params
    p params[:calendar]
    today = params[:calendar].to_date
    @today = today + 7
    @year = @today.year
    @year_month = "#{@today.year} / #{@today.month}"
    @week = []
    7.times do |i|
      w = @today + i
      @week.push(w)
    end

    @able_time = ["9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00"]

    @t = []
    @able_time.each do |t|
      @week.each do |w|
        dt = Time.zone.local(@year, @today.month, w.mday, t)
        @t.push(dt)
      end
    end
  end

  def prev
    p params
    p params[:calendar]
    today = params[:calendar].to_date
    @today = today - 7
    @year = @today.year
    @year_month = "#{@today.year} / #{@today.month}"
    @week = []
    7.times do |i|
      w = @today + i
      @week.push(w)
    end

    @able_time = ["9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00"]

    @t = []
    @able_time.each do |t|
      @week.each do |w|
        dt = Time.zone.local(@year, @today.month, w.mday, t)
        @t.push(dt)
      end
    end
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
end
