class TasksController < ApplicationController
	def index
        @items = Task.where(user_id: current_user.id, task_date: tday)
	end
  def new
  end

  def create
    @hours = current_user.tasks.new(task_params)
    if @hours.save
      destroy
    else
      flash[:notice] = "#{@hours.errors.full_messages[0]}"
      redirect_to new_home_path
    end
  end

  def destroy
    @pop = current_user.availabilities.where(avail_time: params[:task][:task_time], avail_date: params[:task][:task_date]).first
    @pop.destroy
    flash[:notice] = "Task added"
  redirect_to new_home_path
  end

  private
  def task_params
    params.require(:task).permit(:task_time, :task_date, :location, :note, :tasks )
  end
end
