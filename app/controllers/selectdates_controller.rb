class SelectdatesController < ApplicationController
  def index
  end

  def new
    @date = Selectdate.new
  end

  def create
   date = params[:selectdate][:date]
    @items = Task.where(user_id: current_user.id, task_date: date)

  end

end

