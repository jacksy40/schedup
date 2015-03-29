class TasksController < ApplicationController
	def index
        @items = Task.where(user_id: current_user.id, task_date: tday)
	end
  def new
  end

  def create
    @hours = current_user.tasks.new(task_params)
    if @hours.save
      redirect_to tasks_path
    else
    end
  end

  private
  def task_params
    params.require(:task).permit(:task_time, :task_date, :location, :note, :tasks )
  end
end
