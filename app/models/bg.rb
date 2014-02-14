class Bg < ActiveRecord::Base
  
  has_many :users

  def self.options
    return Bg.all.to_a.collect{ |bg| [bg.label, bg.id] }
  end

end
