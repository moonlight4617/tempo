class CalendarsController < ApplicationController
  def new
    @calendar = Calendar.new
  end

  def create
    p params[:hour]
    params[:hour].each do |hour|
      dayhour = hour[1].to_s.split
      p dayhour[0]
      p dayhour[1]
      p dayhour[2]
      p dayhour[3]
      p dayhour[7]    
    end
    
   
    # @calendar = Calendar.new(calendar_params)
  end

  def show
  end

  def edit
  end
end
