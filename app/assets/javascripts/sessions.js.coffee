# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $(".slide").click ->
    event.preventDefault()
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

    $("#back").toggleClass('hide')
    $("#next").toggleClass('hide')

  # $("#menu_area").slideToggle('slow')
  
  $("#login_option").click ->
    opt = $(this).data("option")

    $("#login_omni").slideToggle('fast')
    $("#login_email").slideToggle('fast')
    
    if (opt == "omni")
      $(this).data("option", "email")
      $(this).html("or Login with your social media account")
    else
      $(this).data("option", "omni")
      $(this).html("or Login with your email")

  $(".menu").click ->
    $("#menu_area").slideToggle('slow')

  $.get('/get_defaults.js').done((data) ->
    console.log(data)
  )