
$(document).ready ->

  bg_base= "bg_tiles/full_" + $("#theme").data('bg_base') + ".jpg"
  bg_pop = "bg_tiles/full_" + $("#theme").data('bg_pop') + ".jpg"
  color_a = "#" + $("#theme").data('color_a')
  color_b = "#" + $("#theme").data('color_b')

  $(".bg_base").css("background", "url(#{bg_base}) repeat fixed")
  $(".bg_pop").css("background", "url(#{bg_pop}) repeat fixed")
  $(".bg_color_a").css("background-color", color_a)
  $(".bg_color_b").css("background-color", color_b)
  $(".bg_color_c").css("background-color", "#F8F8F8")
  $(".color_b").css("color", color_b)