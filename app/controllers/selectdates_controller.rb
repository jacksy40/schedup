class SelectdatesController < ApplicationController
  before_action :authenticate_user!

  def new
    @date = Selectdate.new
  end

  def create
    @tasks = Task.where(user_id: current_user.id,
      task_date: params[:selectdate][:date] )
    render :index
  end

end

