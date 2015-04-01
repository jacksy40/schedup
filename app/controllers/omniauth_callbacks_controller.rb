class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    auth = ENV["omniauth.auth"]

    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"],current_user)
    if @user.persisted?
      flash[:notice] = "Welcome, #{@user.username}"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.twitter_uid"] = request.ENV["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
