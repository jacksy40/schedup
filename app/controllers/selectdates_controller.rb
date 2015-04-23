class SelectdatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = current_user.tasks.where( task_date: params[:format] )
    @tasks = Task.new
    @hours = current_user.availabilities.where(
      avail_date: tday).order(avail_time: :asc)
  end

  def new
    @date = Selectdate.new
  end

  def create
    if params[:selectdate][:date] == ""
      flash[:notice] = "please choose a date."
    redirect_to new_selectdate_path
    else
      @tasks = Task.new
      @hours = current_user.availabilities.where(
        avail_date: tday).order(avail_time: :asc)
      @items = Task.where(user_id: current_user.id,
        task_date: params[:selectdate][:date] )
      render :index
    end
  end

  def update
    @current_task = Task.find( params[:id] )
    @update_time = current_user.availabilities.where(
      avail_date: params[:task][:task_date],
      avail_time: params[:task][:task_time] )
      if params[:task][:task_time] == "" || params[:task][:task_date] == ""
        flash[:notice] = "Please check date and time."
      else
        if @current_task.task_time != params[:task][:task_time]
          current_user.availabilities.create(
            avail_date: @current_task.task_date,
            avail_time: @current_task.task_time )
          @update_time.each{ |time| time.destroy }
          @task = @current_task.update_attributes(task_params)
        else
          @task = @current_task.update_attributes(task_params)
          flash[:notice] = "task updated"
        end
      end
    redirect_to selectdates_path
  end

  def destroy
      @task = Task.find(params[:id])
      @task_event = @task.events
      current_user.availabilities.create(avail_date: @task.task_date,
        avail_time: @task.task_time)
      @task_event.destroy_all
      @task.destroy
      redirect_to selectdates_path(@task.task_date)
  end
end

