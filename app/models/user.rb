class User < ActiveRecord::Base

  def self.find_by_auth(auth)
    provider = auth["provider"]
    uid = auth["uid"]
    self.find(provider: auth["provider"], uid: auth["uid"])
  end

# user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
# User.create_with_omniauth(auth)

end