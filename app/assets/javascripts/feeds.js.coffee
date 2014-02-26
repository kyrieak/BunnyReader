# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('document').ready ->

  $("a.ext").click (e) ->
    e.preventDefault()
    window.open(this.href, "_tab")

  bg_base= "bg_tiles/full_" + $("#theme").data('bg_base') + ".jpg"
  bg_pop = "bg_tiles/full_" + $("#theme").data('bg_pop') + ".jpg"
  color_base = "#" + $("#theme").data('color_base')
  color_pop = "#" + $("#theme").data('color_pop')

  $(".side_panel").css("background", "url(#{bg_base}) repeat fixed")
  $(".mini_side_panel").css("background", "url(#{bg_pop}) repeat fixed")
  $(".shelf").css("background-color", color_pop)
  $("#menu_header").css("color", color_pop)

  # for box in $.find('.photobox')
  #   console.log(box)
  #   mleft = Math.floor(Math.random() * (6 - 4 + 1) + 4)
  #   mleft = '' + mleft
  #   console.log(mleft)
  #   img = $(box).find("img")[0]
  #   $(img).css("margin-left", mleft + "%")