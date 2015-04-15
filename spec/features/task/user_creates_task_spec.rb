require "rails_helper"

feature 'user creates a task', %{
  As a user,
  I want to create a task
  So that I can record a event
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'user inputs a task', focus: true do
    availability = FactoryGirl.create(:availability, user: user)
    task = FactoryGirl.create(:task, user: user)

    visit new_home_path

    click_on "Availability"

    fill_in "task_tasks", with: task.tasks
    fill_in "datepicker", with: task.task_date
    select "07:00PM", :from => "task_task_time"
    fill_in "pac-input", with: task.location

    click_button "add"

    visit tasks_path

    expect(page).to have_content("Nothing for today!")

  end

  scenario 'user fails to input a location' do

     task = FactoryGirl.create(:task, user: user)

    visit new_home_path

    click_on "Availability"

    fill_in "task_tasks", with: task.tasks
    fill_in "datepicker", with: task.task_date
    select "07:00PM", :from => "task_task_time"
    fill_in "pac-input", with: ""

    click_on "add"

    expect(page).to have_content("Location can't be blank")
  end
end

