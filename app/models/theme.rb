class Theme < ActiveRecord::Base

def theme_set(base_label, pop_label)
  return { bg_base: base_label, bg_pop: pop_label,
           color_a: self.color_a, color_b: self.color_b }
end

end
