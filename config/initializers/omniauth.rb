Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOG_KEY'], ENV['GOOG_SCT'], :scope => "userinfo.email, userinfo.profile"
  provider :facebook, ENV['FB_KEY'], ENV['FB_SCT'], :scope => "email"
  provider :twitter, ENV['TWIT_KEY'], ENV['TWIT_SCT']
end