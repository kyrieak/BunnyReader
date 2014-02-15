# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# TODO: clean up code, but try to not completely break it beyond fixing


$(document).ready ->

  panel_left = $.find("#login_section")
  panel_right = $.find("#create_account")
  
  # Menu - Vertical Sliding

  $(".menu").click ->
    $("#overlay").toggle()
    $("#menu").slideToggle(400)

  # Panels - Horizontal Sliding

  $(".slide").click ->
    event.preventDefault()

    if ($(panel_left).css('margin-left') == "0px")
      h_distance = $(panel_left).outerWidth(true) * -1.1
      $(panel_right).toggle()
      $(panel_left).animate({
          'margin-left': h_distance
        }, 600, 'linear',
        ->
          $(panel_left).toggle()
      )

      $(panel_right).animate({
          'margin-left': 0
        }, 600, 'linear'
      )
    else
      h_distance = $(panel_right).outerWidth(true) * 1.1
      $(panel_left).toggle()
      $(panel_left).animate({
          'margin-left': 0
        }, 600, 'linear',
        ->
          $(panel_right).toggle()
      )

      $(panel_right).animate({
          'margin-left': h_distance
        }, 600, 'linear'
      )

    $("#back").toggleClass('hide')
    $("#next").toggleClass('hide')


  # Login Options - Vertical Sliding

  $("#login_option").click ->
    opt = $(this).data("option")

    $("#login_omni").slideToggle('fast')
    $("#login_email").slideToggle('fast')

    center_link = $(this).find(".link_like")[0]

    if (opt == "omni")
      $(this).data("option", "email")
      $(center_link).html("Login with your social media account")
    else
      $(this).data("option", "omni")
      $(center_link).html("Login with your email")  

  $.get('/get_defaults.js').done((data) ->
    console.log(data)
  )