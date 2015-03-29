class AvailabilitiesController < ApplicationController

  def index
  end

  def new
    @avail_hours= Availability.where(user_id: current_user.id, avail_date: tday).order(:avail_time)
    @time = Availability.new
  end

  def create
  @hours = current_user.availabilities.new(avail_params)
    if @hours.save
      redirect_to new_availability_path
    else
    end
  end

  def destroy
    @pop = Availability.find(params[:id])
    @pop.destroy
  redirect_to new_availability_path
  end

  def dump
    @pop = Availability.where(user_id: current_user.id, avail_date: tday )
      @pop.each do|p|
        p.destroy
      end
    TIME.each do |t|
      Availability.create(avail_time: t, avail_date: tday, user_id: current_user.id)
    end
  redirect_to new_availability_path
  end

private
  def avail_params
    params.require(:availability).permit(:avail_time, :avail_date)
  end
end

