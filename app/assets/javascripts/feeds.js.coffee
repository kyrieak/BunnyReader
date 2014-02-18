# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('document').ready ->
  bg_hex = $("body").data('hex')

  $('#menu_content .col-md-1').css('background-color', bg_hex)

#  theme = combination accent_label, accent2_label, background_label,