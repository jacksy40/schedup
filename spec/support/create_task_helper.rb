module CreateTaskHelper
  def create_task
    visit new_task_path

    fill_in "task_tasks", with: "task"
    fill_in "datepicker", with: Date.current
    select "07:00AM", :from => "task_task_time"
    fill_in "pac-input", with: "location"

    click_button "add"
  end
end
