class User < ActiveRecord::Base

	has_many :auth_options
  belongs_to :bg

  def self.find_by_email(email, pass)
    User.where(email: email, pass: pass).first
  end

  def self.find_or_create(user_id, name, email='')
    if user_id
      user = User.find(user_id)
      if user.nil?
        user = User.create(name: name)
      end
    else
      user = User.create(name: name, email: email)
    end
    return user
  end

  def lang
    return 2
  end

end