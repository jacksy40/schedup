class TasksController < ApplicationController
	def index

    if params[:date].present?
    @items = current_user.tasks.where(task_date: params[:date])
    else
    @items = current_user.tasks.where(task_date: tday)
    end
    @tasks = Task.new
    @hours = current_user.availabilities.where(
      avail_date: tday).order(avail_time: :asc)
  end

  def new
    @weather = weather
    @tday = tday
    @tasks = Task.new
    @hours = current_user.availabilities.where(
      avail_date: tday).order(avail_time: :asc)
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
    redirect_to tasks_path
end

  def create
      @task = current_user.tasks.new(task_params)
      bindinf.pry
      @task.task_date = params[:task][:task_date]
      if @task.save
        if params[:share].present?
          Event.create!( user_id: current_user.id, task_id: @task.id )
        end
      @time = current_user.availabilities.where(avail_time: params[:task][:task_time],
        avail_date: params[:task][:task_date]).first
      @time.destroy
      flash[:notice] = "Task added"
      redirect_to tasks_path
      else
        flash[:notice] = "#{@task.errors.full_messages.first}"
        redirect_to new_task_path
      end
  end

  def destroy
      @task = Task.find(params[:id])
      @task_event = @task.events
      current_user.availabilities.create(avail_date: @task.task_date,
        avail_time: @task.task_time)
      @task_event.destroy_all
      @task.destroy
      redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:task_time, :task_date, :location, :note, :tasks )
  end
end
