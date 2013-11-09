# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $("#slide_left").click ->
    elm = $.find('#login_left.col-md-6')[0]
    jumbo = $.find('.jumbotron')[0]
    r_elm = $.find('#login_right.col-md-6.right')[0]
    h_distance = $(jumbo).outerWidth(true) * -1.1

    console.log(h_distance)
    $(elm).animate(
      'margin-left': h_distance
    )

  $("#slide_right").click ->
    elm = $.find('#login_left.col-md-6')[0]

    $(elm).animate('margin-left': 0)

  $("#login_area").slideToggle('slow', () ->
    console.log("here in slidetoggle")
    $("#login_area").addClass("in")
  )