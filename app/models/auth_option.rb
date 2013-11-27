class AuthOption < ActiveRecord::Base

	belongs_to :user

  def self.find_or_create(provider, uid)
    auth_opt = AuthOption.where(provider: provider, uid: uid).first
    if auth_opt.nil?
      auth_opt = AuthOption.create(provider: provider, uid: uid)
    end
    return auth_opt
  end

end
