class Bg < ActiveRecord::Base
  
  has_many :users

  def self.options
    return Bg.all.sort_by do |bg|
             bg.hue + (bg.order * 1000)
           end.collect{ |bg| [bg.label, bg.id] }
  end

  def self.get_pair(bg_base_id, bg_pop_id)
    return { bg_base: Bg.find(bg_base_id).label,
              bg_pop: Bg.find(bg_pop_id).label }
  end
end
