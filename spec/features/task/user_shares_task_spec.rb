require "rails_helper"

feature 'user shares a task', %{
  As a user,
  I want to share a task
  So that I can create an event to have other users join
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'user shares a task' do

    create_task

    first('.share').click_link 'share'

    expect(page).to have_content("Event created")

  end

end
