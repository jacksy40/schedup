class HomesController < ApplicationController

  def index
    @weather = weather
    @hours = Availability.where(user_id: current_user.id, avail_date: tday)
  end

  def new
    @tday = tday
  @tasks = Task.new
  @hours = Availability.where(user_id: current_user.id, avail_date: tday)
  end

  def create
  end

  def weather
  api_key = ENV['WEATHER_KEY']
    open("http://api.wunderground.com/api/#{api_key}/geolookup/conditions/q/MA/Boston.json") do |f|
    json_string = f.read
    parsed_json = JSON.parse(json_string)
    location = parsed_json['location']['city']
    temp_f = parsed_json['current_observation']['temp_f']
    "Current temperature in #{location} is: #{temp_f}ºf"
    end
  end
end
