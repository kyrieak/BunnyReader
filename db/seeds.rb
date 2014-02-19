# require_relative 'seed_msn_sankei'
# require_relative 'seed_slate'
# require_relative 'seed_npr'
# require_relative 'seed_nyt'
# require_relative 'seed_guardian'

# seed_msn_sankei
# seed_slate
# seed_npr
# seed_nyt
# seed_guardian

# def seed_bgs
#   Bg.create(name: 'abstract_curtain_with_bluish_tint.jpg')
#   Bg.create(name: 'dark-stone-wall-background-tile.jpg')
#   Bg.create(name: 'glassy-orange-pattern.jpg')
#   Bg.create(name: 'maple-seamless_wood_texture.jpg')
#   Bg.create(name: 'polished-stone-gray-website-background.jpg')
#   Bg.create(name: 'seamless-paper-texture-light-blue-gray.jpg')
#   Bg.create(name: 'seamless_green_background.jpg')
#   Bg.create(name: 'seamless_light_blue_texture_for_web_sites.jpg')
#   Bg.create(name: 'tileable-dark-brown-wood-background.jpg')
# end


# seed_bgs

Theme.all.each do |t|
  t.color_base = "F8F8F8"
  t.color_pop = "000000"
  t.save
end

# Theme.create(bg_base: , bg_pop: , color_pop: "", color_base: "")