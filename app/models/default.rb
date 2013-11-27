class Default < ActiveRecord::Base

  belongs_to :user
  has_one :bg

end
