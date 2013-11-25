# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $(".slide").click ->
    elm = $.find('#login_left.col-md-6')[0]

    if ($(elm).css('margin-left') == "0px")
      jumbo = $.find('.jumbotron')[0]
      h_distance = $(jumbo).outerWidth(true) * -1.1
      $(elm).animate(
        'margin-left': h_distance
      )
      console.log("im here if")
    else
      console.log($(elm).css('margin-left'))
      $(elm).animate('margin-left': 0)
      console.log("im here else")


    $("#back").toggleClass('hidden')
    $("#next").toggleClass('hidden')
    

  $("#menu_area").slideToggle('slow')
  
  $("#email_section h5").click ->
    $("#email_login").slideToggle('fast')
    $("#email_account").slideToggle('fast')

  $(".menu").click ->
    $("#menu_area").slideToggle('slow')