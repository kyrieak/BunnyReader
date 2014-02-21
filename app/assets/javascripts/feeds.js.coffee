# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('document').ready ->
  bg_base= "bg_tiles/full_" + $("#theme").data('bg_base') + ".jpg"
  bg_pop = "bg_tiles/full_" + $("#theme").data('bg_pop') + ".jpg"
  color_base = "#" + $("#theme").data('color_base')
  color_pop = "#" + $("#theme").data('color_pop')

  $(".side_panel").css("background", "url(#{bg_base}) repeat fixed")
  $("#menu_content .col-md-1").css("background", "url(#{bg_pop}) repeat fixed")
  $("#menu_content .col-md-4").css("background-color", color_base)
  $("h2, h3, h4").css("color", color_pop)