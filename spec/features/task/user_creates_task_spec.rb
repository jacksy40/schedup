require "rails_helper"

feature 'user creates a task', %{
  As a user,
  I want to create a task
  So that I can record an event
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'user inputs a task' do

    visit new_task_path

    fill_in "task_tasks", with: "task"
    fill_in "datepicker", with: Date.current
    select "07:00AM", :from => "task_task_time"
    fill_in "pac-input", with: "location"

    click_button "add"

    expect(page).to have_content("task")
    expect(page).to have_content(Date.current.strftime("%m-%d-%Y"))
    expect(page).to have_content("07:00AM")
    expect(page).to have_content("location")
  end

  scenario 'user leaves location blank' do

    visit new_task_path

    fill_in "task_tasks", with: "task"
    fill_in "datepicker", with: Date.current
    select "01:00PM", :from => "task_task_time"
    fill_in "pac-input", with: ""

    click_on "add"

    expect(page).to have_content("Location can't be blank")
  end

  scenario 'user leaves task blank' do

    visit new_task_path

    fill_in "task_tasks", with: ""
    fill_in "datepicker", with: Date.current
    select "01:00PM", :from => "task_task_time"
    fill_in "pac-input", with: "Location"

    click_on "add"

    expect(page).to have_content("Tasks can't be blank")
  end

end

