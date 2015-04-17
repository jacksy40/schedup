require "rails_helper"

feature 'user delete a task', %{
  As a user,
  I want to delete a task
  So that I can remove the task from my schedule
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'user deletes a task' do

    create_task

    first('.delete').click_link 'delete'

    expect(page).to have_content("Nothing for today!")

  end

end
