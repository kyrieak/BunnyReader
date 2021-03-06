# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# TODO: clean up code, but try to not completely break it beyond fixing


$(document).ready ->
  panels = $("#menu_content").find(".panel")
  panel_left = panels[0]
  panel_right = panels[1]
  console.log(panel_left)
  console.log(panel_right)
  panel_slide_dist = $(panel_left).outerWidth(true) * 1.1

  # Menu - Vertical Sliding

  $(".m_tog").click ->
    $("#overlay").toggle()
    $("#menu_content").slideToggle(400)

  # Panels - Horizontal Sliding

  slide_panel = (panel, m_left, toggle_to_hide) ->
    console.log( m_left)
    $(panel).animate({
        'margin-left': m_left
      }, 400, 'swing',
      ->
        $(panel).toggle() if (toggle_to_hide)
    )

  $(".slide").click ->
    event.preventDefault()

    if ($(panel_left).css('margin-left') == "0px")
      h_distance = $(panel_left).outerWidth(true) * -1.1
      $(panel_right).toggle()

      slide_panel(panel_left, h_distance, true)
      slide_panel(panel_right, 0, false)
      # $('#login_option').css('visibility', 'hidden')
    else
      h_distance = $(panel_right).outerWidth(true) * 1.1
      $(panel_left).toggle()
      
      slide_panel(panel_left, 0, false)
      slide_panel(panel_right, h_distance, true)
      
      # $('#login_option').css('visibility', 'show')
    $('#login_option h4').toggleClass('v_hidden')
    $("#back").toggleClass('v_hidden')
    $("#next").toggleClass('v_hidden')


  # Login Options - Vertical Sliding

  $("#login_option").click ->
    opt = $(this).data("option")

    $("#login_omni").slideToggle(400)
    $("#login_email").slideToggle(400)

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