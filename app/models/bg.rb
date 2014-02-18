class Bg < ActiveRecord::Base
  
  has_many :users

  def self.options
    return Bg.all.sort_by do |bg|
             bg.hue + (bg.order * 1000)
           end.collect{ |bg| [bg.label, bg.id] }
  end

  def self.set_of_three(main_id, accent_a_id, accent_b_id)
    return { main_bg: Bg.find(main_id).label,
              accent_a: Bg.find(accent_a_id).label,
              accent_b: Bg.find(accent_b_id).label }
  end
end
