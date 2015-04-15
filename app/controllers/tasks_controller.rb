class TasksController < ApplicationController
	def index
    @items = Task.where(user_id: current_user.id, task_date: tday)
    @tasks = Task.new
    @hours = Availability.where(user_id: current_user.id,
      avail_date: tday).order(avail_time: :asc)
	end

  def update
    @current_task = Task.find( params[:id] )
    @update_time = Availability.where(
      user_id: current_user.id,
      avail_date: params[:task][:task_date],
      avail_time: params[:task][:task_time] )
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
    redirect_to tasks_path
end

  def create
      @task = current_user.tasks.new(task_params)
      @task.task_date = params[:task][:task_date]
      if @task.save
        if params[:share].present?
          Event.create!( user_id: current_user.id, task_id: @task.id )
        end
        destroy
      else
        flash[:notice] = "#{@task.errors.full_messages.first}"
        redirect_to new_home_path
      end
  end

  def destroy
    if params[:id].present?
      @task = Task.find(params[:id])
      @task_event = @task.events
      current_user.availabilities.create(avail_date: @task.task_date,
        avail_time: @task.task_time)
      @task_event.destroy_all
      @task.destroy
      redirect_to tasks_path
    else
      @time = current_user.availabilities.where(avail_time: params[:task][:task_time],
        avail_date: params[:task][:task_date]).first
      @time.destroy
      flash[:notice] = "Task added"
      redirect_to tasks_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:task_time, :task_date, :location, :note, :tasks )
  end
end
