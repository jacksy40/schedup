class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!


TIME = ['7:00_am','8:00_am','9:00_am','10:00_am','11:00_am','12:00_pm','1:00_pm','2:00_pm','3:00_pm','4:00_pm','5:00_pm','6:00_pm']
  def user_id
    current_user.id
  end

  def month
    @date = Time.new
    if @date.month < 10
     "0#{@date.month}"
   else
     @date.month
    end
  end

  def day
    @date = Time.new
   if @date.day < 10
     "0#{@date.day}"
   else
     @date.day
   end
  end
  def tday
    @date = Time.new
    return "#{@date.year}-#{month}-#{day}"
  end

  def load_hours
    @avail = current_user.availabilities.last
    if @avail.avail_date != tday
      binding.pry
      TIME.each do |t|
      Availability.create(avail_time: t, avail_date: tday, user_id: current_user.id)
      end
    else
    end
  end
end
