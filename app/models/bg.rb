class Bg < ActiveRecord::Base

  def self.options
    return Bg.all.to_a.collect{ |bg| [bg.name, bg.id] }
  end

end
