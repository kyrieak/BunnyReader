class Theme < ActiveRecord::Base

def theme_set(base_label, pop_label)
  return { bg_base: base_label, bg_pop: pop_label,
           color_pop: self.color_pop, color_base: self.color_base }
end

end
