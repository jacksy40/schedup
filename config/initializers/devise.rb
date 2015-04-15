Devise.setup do |config|
  config.secret_key = '9405db9170d9c2c04203b79e05f955b1a159bb5ead908c07799cca827e4ec686f83530d5bc91792b6bf54b17796b32bfea309ebe67e6cdd5275ee095c3424b5f'
require 'omniauth-twitter'
  config.omniauth :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
