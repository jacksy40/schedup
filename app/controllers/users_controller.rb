class UsersController < ApplicationController

def update
  @task = current_user.update_attributes(username: params[:username])
  binding.pry
  flash[:notice] = "username updated"
  redirect_to tasks_path
end


end

