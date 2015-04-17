require "rails_helper"

feature 'user edits a task', %{
  As a user,
  I want to edit a task
  So that I can change the detail of my task
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'user edits a task' do

    create_task

    first('.edit').click_link 'edit'

    first('.review-form').fill_in 'task_tasks', with: 'Go running'
    first('.review-form').fill_in 'pac-input', with: 'Boston'
    first('.submit-button').click_button 'update'

    expect(page).to have_content("Go running")
    expect(page).to have_content(Date.current.strftime("%m-%d-%Y"))
    expect(page).to have_content("07:00AM")
    expect(page).to have_content("Boston")
  end

  scenario 'user edits a task' do

    create_task

    first('.edit').click_link 'edit'

    first('.review-form').fill_in 'task_task_time', with: ''
    first('.review-form').fill_in 'pac-input', with: 'Boston'
    first('.submit-button').click_button 'update'

    expect(page).to have_content("Please check date and time")
  end

  scenario 'user edits a task' do

    create_task

    first('.edit').click_link 'edit'

    first('.review-form').fill_in 'datepicker', with: ''

    first('.submit-button').click_button 'update'

    expect(page).to have_content("Please check date and time")
  end
end
