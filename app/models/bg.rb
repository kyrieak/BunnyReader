class Bg < ActiveRecord::Base
  
  has_many :users

  def self.options
    return Bg.all.sort_by do |bg|
             bg.hue + (bg.order * 1000)
           end.collect{ |bg| [bg.label, bg.id] }
  end

end
