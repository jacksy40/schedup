module AuthenticationHelper
  def sign_in_as(user)
    visit root_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end
end
